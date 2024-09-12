
### rwlock interface

```c++
class ReadWriteLock {  
public:  
    virtual void read_lock() = 0;  
  
    virtual void read_unlock() = 0;  
  
    virtual void write_lock() = 0;  
  
    virtual void write_unlock() = 0;  
};
```



### simple rwlock

```c++

```