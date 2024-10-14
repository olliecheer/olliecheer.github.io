---
tags:
  - bitwise
---
![[problems/pictures/Pasted image 20241013233952.png]]



```c++
template <typename T> using vec = std::vector<T>;

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