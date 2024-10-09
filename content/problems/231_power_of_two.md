---
tags:
---
![[problems/pictures/Pasted image 20240908191832.png]]

```c++
class Solution {
public:
  bool isPowerOfTwo(int n) { return n > 0 && (n & (n - 1)) == 0; }
};
```

```c++
class Solution {
public:
  bool isPowerOfTwo(int n) {
    if (n <= 0)
      return false;

    while (n % 2 == 0)
      n /= 2;

    return n == 1;
  }
};
```