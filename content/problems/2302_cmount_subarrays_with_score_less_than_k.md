---
tags:
  - subarray
---
![[problems/pictures/Pasted image 20240910021425.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  long long countSubarrays(vec<int> &nums, long long k) {
    long long sum = 0, res = 0;
    for (int i = 0, j = 0; i < nums.size(); i++) {
      sum += nums[i];
      while (sum * (i - j + 1) >= k)
        sum -= nums[j++];

      res += i - j + 1;
    }

    return res;
  }
};
```