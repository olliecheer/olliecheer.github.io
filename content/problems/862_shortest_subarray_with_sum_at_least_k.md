---
tags:
  - subarray
  - sum
---
![[problems/pictures/Pasted image 20240910001830.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int shortestSubarray(vec<int> &nums, int k) {
    int N = nums.size();
    int res = N + 1;
    vec<int64_t> sum(N + 1);
    for (int i = 0; i < N; i++)
      sum[i + 1] = sum[i] + nums[i];

    std::deque<int> dq;
    for (int i = 0; i < N + 1; i++) {
      while (!dq.empty() && sum[i] - sum[dq.front()] >= k) {
        res = std::min(res, i - dq.front());
        dq.pop_front();
      }

      while (!dq.empty() && sum[dq.back()] >= sum[i])
        dq.pop_back();

      dq.push_back(i);
    }

    return res <= N ? res : -1;
  }
};
```