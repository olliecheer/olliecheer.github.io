---
tags:
  - subarray
---
![[problems/pictures/Pasted image 20240910010329.png]]

```c++
class Solution {  
  int atMost(vec<int> &nums, int k) {  
    int res = 0, left = 0, n = nums.size();  
    for (int i = 0; i < n; i++) {  
      k -= nums[i] % 2;  
      while (k < 0) {  
        k += nums[left] % 2;  
        left++;  
      }  
    }  
  
    return res;  
  }  
  
public:  
  int numberOfSubarrays(vec<int> &nums, int k) {  
    return atMost(nums, k) - atMost(nums, k - 1);  
  }  
};
```