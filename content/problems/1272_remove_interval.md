---
tags:
  - scanning_line
---
![[problems/pictures/Pasted image 20241013222655.png]]
![[problems/pictures/Pasted image 20241013222716.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<vec<int>> removeInterval(vec<vec<int>> &intervals,
                               vec<int> &toBeRemoved) {
    vec<vec<int>> res;
    for (auto &&it : intervals)
      if (it[1] <= toBeRemoved[0] || it[0] >= toBeRemoved[1])
        res.push_back({it[0], it[1]});
      else {
        if (it[0] < toBeRemoved[0])
          res.push_back({it[0], toBeRemoved[0]});

        if (it[1] > toBeRemoved[1])
          res.push_back({toBeRemoved[1], it[1]});
      }

    return res;
  }
};
```