---
tags:
  - sliding_window
---
![[problems/pictures/Pasted image 20241014001635.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> maxSlidingWindow(vec<int> &nums, int k) {
    int N = nums.size();
    std::deque<int> dq;
    vec<int> res(N - k + 1);
    for (int i = 0; i < N; i++) {
      while (!dq.empty() && i - dq.front() >= k)
        dq.pop_front();

      while (!dq.empty() && nums[dq.back()] <= nums[i])
        dq.pop_back();

      dq.push_back(i);

      int start_window_index = i - k + 1;
      if (start_window_index >= 0)
        res[start_window_index] = nums[dq.front()];
    }

    return res;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> maxSlidingWindow(vec<int> &nums, int k) {
    int N = nums.size();
    vec<int> res(N - k + 1);

    auto comp = [](vec<int> const &a, vec<int> const &b) {
      return a[1] < b[1];
    };

    std::priority_queue<vec<int>, vec<vec<int>>, decltype(comp)> pq(comp);

    for (int i = 0; i < k; i++)
      pq.push({i, nums[i]});

    res[0] = pq.top()[1];
    for (int i = k, index = 1; i < N; i++, index++) {
      while (!pq.empty() && i - pq.top()[0] >= k)
        pq.pop();

      pq.push({i, nums[i]});
      res[index] = pq.top()[1];
    }

    return res;
  }
};
```