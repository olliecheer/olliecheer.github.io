---
tags:
  - pow
---
![[pictures/Pasted image 20241014004558.png]]


```c++
class Solution {
public:
  bool isPowerOfFour(int num) {
    // num & (num - 1) => clear the very first bit 1 from the right

    // positive
    // only one bit 1 => so it is a power of 2
    // the power is an even
    return (num > 0) && ((num & (num - 1)) == 0) && ((num & 0xaaaaaaaa) == 0);
  }
};
```
