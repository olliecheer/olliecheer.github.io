---
tags:
  - majority_number
---
![[pictures/Pasted image 20241014001045.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> majorityElement(vec<int> &nums) {
    vec<int> res;
    int c1 = 0, c2 = 0;
    int n1 = 0, n2 = 0;

    for (int it : nums) {
      if (it == n1)
        c1++;
      else if (it == n2)
        c2++;
      else if (c1 == 0) {
        n1 = it;
        c1 = 1;
      } else if (c2 == 0) {
        n2 = it;
        c2 = 1;
      } else {
        c1--;
        c2--;
      }
    }

    c1 = 0;
    c2 = 0;

    for (int it : nums) {
      if (it == n1)
        c1++;
      else if (it == n2)
        c2++;
    }

    if (c1 > nums.size() / 3)
      res.push_back(n1);

    if (c2 > nums.size() / 3)
      res.push_back(n2);

    return res;
  }
};
```