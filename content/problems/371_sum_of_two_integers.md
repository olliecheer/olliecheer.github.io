---
tags:
  - sum
  - bit
---
![[pictures/Pasted image 20241014004925.png]]


```c++
class Solution {
public:
  int getSum(int a, int b) {
    //  011
    // +101
    // 1000

    while (b) {
      int carry = a & b;
      a = a ^ b;
      b = carry << 1;
    }

    return a;
  }
};
```
