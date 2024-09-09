---
tags:
  - subarray
---
![[problems/pictures/Pasted image 20240910021425.png]]


```c++
class Solution {  
public:  
  long countSubarrays(vec<int> &nums, long k) {  
    long sum = 0, res = 0;  
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