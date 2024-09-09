---
tags:
---
![[problems/pictures/Pasted image 20240909220441.png]]

```c++
class Solution {  
public:  
  void moveZeroes(vec<int> &nums) {  
    int left = 0, N = nums.size();  
    for (int right = 0; right < N; right++) {  
      if (nums[right] != 0) {  
        nums[left] = nums[right];  
        left++;  
      }  
    }  
  
    for (; left < N; left++)  
      nums[left] = 0;  
  }  
};
```