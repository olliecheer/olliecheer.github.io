---
tags:
  - subsequence
---
![[problems/pictures/Pasted image 20241013223933.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int constrainedSubsetSum(vec<int> &nums, int k) {
    std::deque<int> dq;
    int N = nums.size();
    vec<int> sum(N);
    int res = nums[0];

    for (int i = 0; i < N; i++) {
      sum[i] = nums[i];
      if (!dq.empty())
        sum[i] += sum[dq.front()];

      res = std::max(res, sum[i]);
      if (!dq.empty() && i - dq.front() >= k)
        dq.pop_front();

      while (!dq.empty() && sum[dq.back()] <= sum[i])
        dq.pop_back();

      if (sum[i] > 0)
        dq.push_back(i);
    }

    return res;
  }
};
```