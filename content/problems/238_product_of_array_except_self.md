---
tags:
  - array
---
![[problems/pictures/Pasted image 20240908192237.png]]

```c++
class Solution {  
public:  
  vec<int> productExceptSelf(vec<int> nums) {  
    vec<int> left(nums.size()), right(nums.size());  
    left[0] = 1;  
    right.back() = 1;  
  
    for (int i = 1; i < nums.size(); i++) {  
      left[i] = left[i - 1] * nums[i - 1];  
    }  
  
    for (int i = nums.size() - 2; i >= 0; i--) {  
      right[i] = right[i + 1] * nums[i + 1];  
    }  
  
    for (int i = 0; i < nums.size(); i++) {  
      left[i] *= right[i];  
    }  
  
    return left;  
  }  
};
```