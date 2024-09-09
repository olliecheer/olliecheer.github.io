---
tags:
  - pow
---
![[problems/pictures/Pasted image 20240909214509.png]]

```c++
class Solution {  
public:  
  bool isPowerOfFour(int num) {  
    return (num > 0) && ((num & (num - 1)) == 0) && ((num & 0xaaaaaaaa) == 0);  
  }  
};
```
