---
tags:
  - binary_search
---
![[problems/pictures/Pasted image 20240909232445.png]]

```c++
class Solution {  
public:  
  int search(vec<int> nums, int target) {  
    int left = 0, right = nums.size() - 1;  
    while (left <= right) {  
      int mid = left + (right - left) / 2;  
      if (nums[mid] > target) {  
        right = mid - 1;  
      } else if (nums[mid] < target) {  
        left = mid + 1;  
      } else {  
        return mid;  
      }  
    }  
    return -1;  
  }  
};
```