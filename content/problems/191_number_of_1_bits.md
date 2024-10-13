---
tags:
  - bitwise
---
![[pictures/Pasted image 20241013235410.png]]
![[pictures/Pasted image 20241013235418.png]]



```c++
class Solution {
public:
  int hammingWeight(int n) {
    int count = 0, mask = 1;
    for (int i = 0; i < 32; i++) {
      if ((n & mask) != 0)
        count++;
      mask <<= 1;
    }

    return count;
  }
};
```


```c++
class Solution {
public:
  int hammingWeight(int n) {
    int count = 0, mask = 1;
    while (n) {
      count++;
      n &= (n - 1);
    }

    return count;
  }
};
```