---
tags:
  - sum
  - bit
---
![[problems/pictures/Pasted image 20240909220103.png]]

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
