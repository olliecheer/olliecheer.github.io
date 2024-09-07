---
tags:
  - containing_water
  - dual_pointers
---
![[problems/pictures/Pasted image 20240907192935.png]]![[pictures/Pasted image 20240907192957.png]]

```c++
class Solution {  
public:  
  int maxArea(vec<int> &height) {  
    int left = 0, right = height.size() - 1;  
    int res = 0;  
  
    while (left < right) {  
      auto area = std::min(height[left], height[right]) * (right - left);  
      res = std::max(res, area);  
      if (height[left] <= height[right]) {  
        left++;  
      } else {  
        right--;  
      }  
    }  
  
    return res;  
  }  
};
```