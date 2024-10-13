---
tags:
  - interval
  - array
---
![[pictures/Pasted image 20241012200625.png]]
![[pictures/Pasted image 20241012200637.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<vec<int>> insert(vec<vec<int>> &intervals, vec<int> &newInterval) {
    int left = newInterval[0], right = newInterval[1];
    bool placed = false;
    vec<vec<int>> res;

    for (auto &interval : intervals) {
      if (interval[0] > right) {
        if (!placed) {
          res.push_back({left, right});
          placed = true;
        }
        res.push_back(interval);
      } else if (interval[1] < left) {
        res.push_back(interval);
      } else {
        left = std::min(left, interval[0]);
        right = std::max(right, interval[1]);
      }
    }

    if (!placed) {
      res.push_back({left, right});
    }

    return res;
  }
};
```