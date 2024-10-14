---
tags:
---
![[problems/pictures/Pasted image 20241014004352.png]]
![[problems/pictures/Pasted image 20241014004405.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> countBits(int num) {
    vec<int> res(num + 1);
    for (int i = 1; i <= num; i++)
      res[i] = res[i / 2] + (i % 2);

    return res;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> countBits(int num) {
    vec<int> res(num + 1);
    for (int i = 1; i <= num; i++)
      // i & (i-1) => remove the first bit 1 from the right
      res[i] = res[i & (i - 1)] + 1;

    return res;
  }
};
```