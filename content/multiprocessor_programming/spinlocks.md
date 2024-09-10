
## Lock interface

```c++
class Lock {  
public:  
    virtual void lock() = 0;  
  
    virtual void unlock() = 0;  
};
```

## TAS Lock and TTAS Lock

- **TAS Lock** -- Test And Set Lock
```c++
class TASLock : public Lock {  
    std::atomic<bool> state{false};  
public:  
    void lock() final {  
        while (state.exchange(true, std::memory_order::memory_order_seq_cst));  
    }  
  
    void unlock() final {  
        state.store(false, std::memory_order::memory_order_seq_cst);  
    }  
};
```

Due to CPU ***cache coherence protocol***, the *exchange()* caller thread must request an **exclusive** copy of the lock, unless its processor's cache already has such a copy. This request forces other processors to **invalidate** their cached copies of the lock. If multiple threads are spinning on the lock, almost every call to *exchange()* will result in a cache miss and a request on the bus to fetch the value, even if this value has never changed.
When the lock holder thread tries to release it, it may be delayed because the bus is ***monopolized by the spinners***. 
Because all threads use the bus to communicate with memory, event threads not waiting for the lock may be delayed.
Above explanation reveals why TASLock performs so poorly.


- **TTAS Lock** -- Test Test And Set Lock
```c++
class TTASLock : public Lock {  
    std::atomic<bool> state{false};  
public:  
    void lock() final {  
        while (true) {  
            while (state.load(std::memory_order::memory_order_seq_cst));  
            if (!state.exchange(true))  
                return;  
        }  
    }  
  
    void unlock() final {  
        state.store(false, std::memory_order::memory_order_seq_cst);  
    }  
};
```


***TTAS Lock*** changes the **exclusive** spinning to **shared** spinning, thus reducing enormous **cache invalidation**. In the view of spinning threads, they are **spinning locally**, without frequent cache bouncing.

When the lock holder releases the lock, a write operation will be applied to this atomic variable. Because this variable is shared with all threads spinning on it, this *write* (**the holder**) causes a cache miss (because of the *shared* state of this cache line, which is expected to be exclusive), resulting in a request (**the holder**) on the bus for an *exclusive* copy of the lock.

This request invalidates the cached copies of the spinning threads. Each one has a cache miss and rereads the new value, and they all try to acquire the lock. The first to succeed **invalidates the others**, which(the losers) must reread the value, causing a storm of bus traffic.

Eventually, the threads settle down once again to **local spinning**.

==The notion of ***local spinning***, where threads repeatedly **reread cached values** instead of repeatedly using the bus, is an important principle critical to the design of efficient spin locks.==



## Backoff Lock

```c++
class BackoffLock : public Lock {  
    class ExponentialBackoff {  
        int min_delay, max_delay;  
        int limit;  
        std::random_device rd;  
  
    public:  
        ExponentialBackoff(int min, int max)  
                : min_delay{min}, max_delay{max}, limit{min_delay} {  
        }  
  
        void backoff() {  
            int delay = std::uniform_int_distribution<int>{0, limit}(rd);  
            limit = std::min(max_delay, 2 * limit);  
            std::this_thread::sleep_for(std::chrono::milliseconds(delay));  
        }  
    };  
      
    std::atomic<bool> state{false};  
    static int MIN_DELAY, MAX_DELAY;  
  
public:  
  
    void lock() final {  
        ExponentialBackoff backoff(MIN_DELAY, MAX_DELAY);  
        while (true) {  
            while (state.load(std::memory_order::memory_order_seq_cst));  
            if (!state.exchange(true))  
                return;  
            else  
                backoff.backoff();  
        }  
    }  
  
    void unlock() final {  
        state.store(false);  
    }  
};
```


***Contention*** on a lock occurs when multiple threads try to acquire the lock at the same time. 
Attempting to acquire a highly contended lock is a bad idea because of cache bouncing. Such an attempt contributes to bus traffic at a time when the thread's chances of acquiring the lock are slim.

If **a thread fails to acquire** the lock in the second step (TTAS Lock), then **some other thread must have acquired** the lock between the first and second step, so **most likely there is high contention** for that lock.

To ensure that competing threads do not fall into lockstep, each backing off and then trying again to acquire the lock at the same time, the thread backs off for a random duration.

==The larger the number of unsuccessful tries, the higher the likely contention, so the longer the thread should back off.==


**Drawbacks**
- There may be some **delay** before another thread attempts to acquire it, even though many threads are waiting to acquire the lock. Such delay increases as the contention increases.
- Backoff Lock can be **unfair**, allowing one thread to acquire the lock many times, while other threads are waiting (**starvation**). The thread that just released the lock might never notice that the lock is contended, and so not back off at all.
	- Such **unfairness** has some **positive consequences**: The repeated access to the same thread without intervening accesses by threads at different processors **reduces cache misses** dur to accesses to this data structure, and so **reduces bus traffic** and avoids the latency of communication. For longer critical sections, this effect can be more significant that the effect of reduced contention on the lock itself. So **there is a tension between fairness and performance.**



## Queue Locks

Aside from back-off lock, queue lock is another approach to implementing scalable spin locks. It's slightly more complicated, but inherently more portable and avoids or ameliorates many of the problems of back-off locks.

The idea is to have threads waiting to acquire the lock from a **queue**, with each thread discovering when its turn has arrived by checking whether its **predecessor** has finished. Cache-coherence traffic is reduced by having each thread **spin on a different location**, and first-come-first-served fairness is provided by the queue inherently.

### Array-based lock

```c++
template<int capacity>  
class ArrayLock : public Lock {  
    std::unordered_map<std::thread::id, int> tid2slot;  
    std::mutex tid2slot_mtx; // Need a mutex to protect tid2slot. Ignore this... 
    std::atomic<int> tail;  
  
    static_assert(capacity > 0, "capacity has to be larger than 0");  
    bool flag[capacity]; // There may be cache bouncing due to cache line size. Proper layout can fix this issue.  
  
public:  
    explicit ArrayLock()  
            : tail{}, flag{} {  
        flag[0] = true;  
    }  
  
    void lock() final {  
        int slot = tail.fetch_add(1, std::memory_order::memory_order_seq_cst) % capacity;  
        {  
            std::scoped_lock lk(tid2slot_mtx);  // Ignore this...
            tid2slot[std::this_thread::get_id()] = slot;  
        }  
        while (!flag[slot]);  
    }  
  
    void unlock() final {  
        int slot;  
        {  
            std::scoped_lock lk(tid2slot_mtx);  // Ignore this...
            slot = tid2slot[std::this_thread::get_id()];  
        }  
        flag[slot] = false;  
        flag[(slot + 1) % capacity] = true;  
    }  
};
```


Contention may still occur because of a phenomenon called ***false sharing***, which occurs when **adjacent data items share a single cache line**. A write to one item invalidates that item's cache line, which causes invalidation traffic to processors that are spinning on nearby unchanged items that happen to fall in the same cache line.

Properly **padding** array elements can avoid false sharing.

Array Lock is **not space-efficient**. It requires a known bound **n** on the maximum number of concurrent threads, and it allocates an array of that size per lock. Synchronizing **L** distinct objects requires ***O(Ln)*** space, event if a thread accesses only one lock at a time.



### CLH Queue Lock