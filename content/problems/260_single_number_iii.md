---
tags:
  - bitwise
---
![[problems/pictures/Pasted image 20241014002049.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> singleNumber(vec<int> &nums) {
    uint32_t xor_ = 0;
    for (int it : nums)
      xor_ ^= it;

    int last_digit = xor_ & (-xor_);
    int g1 = 0, g2 = 0;

    for (int it : nums) {
      if ((last_digit & it) == 0)
        g1 ^= it;
      else
        g2 ^= it;
    }

    return {g1, g2};
  }
};
```