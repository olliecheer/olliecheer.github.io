---
tags:
  - bitwise
---

![[problems/pictures/Pasted image 20240908031454.png]]
```c++
class Solution {  
public:  
  int singleNumber(vec<int> &nums) {  
    int res = 0;  
    for (int it : nums)  
      res ^= it;  
    return res;  
  }  
};
```