---
tags:
  - subsequence
---
![[problems/pictures/Pasted image 20240910012756.png]]

```c++
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
  
      while (!dq.empty() && sum[dq.front()] <= sum[i])  
        dq.pop_back();  
  
      if (sum[i] > 0)  
        dq.pop_back();  
    }  
  
    return res;  
  }  
};
```