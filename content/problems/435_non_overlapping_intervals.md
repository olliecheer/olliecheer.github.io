---
tags:
  - greedy
---
![[problems/pictures/Pasted image 20240909222422.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int eraseOverlapIntervals(vec<vec<int>> &intervals) {
    if (intervals.empty())
      return 0;

    std::sort(intervals.begin(), intervals.end(),
              [](auto &a, auto &b) { return a[1] < b[1]; });
    int count = 0;
    int end = INT_MIN;

    for (auto &&it : intervals) {
      if (end <= it[0])
        end = it[1];
      else
        count++;
    }

    return count;
  }
};
```