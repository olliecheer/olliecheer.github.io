---
tags:
  - random
---
![[problems/pictures/Pasted image 20240909220947.png]]

```c++
class Solution {  
  vec<int> nums;  
  
public:  
  explicit Solution(vec<int> nums) : nums{std::move(nums)} {}  
  
  int pick(int target) {  
    int res = -1, count = 1;  
  
    for (int i = 0; i < nums.size(); i++) {  
      if (nums[i] == target && rand() % count == 0)  
        res = i;  
  
      count++;  
    }  
  
    return res;  
  }  
};
```