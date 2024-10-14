---
tags:
  - scanning_line
---
![[problems/pictures/Pasted image 20240925224332.png]]


```c++
template <typename T> using vec = std::vector<T>;

struct Interval {
  int start;
  int end;
};

class Solution {
public:
  int countOfAirplanes(vec<Interval> &airplanes) {
    vec<vec<int>> lst;
    for (auto &interval : airplanes) {
      lst.push_back({interval.start, 1});
      lst.push_back({interval.end, -1});
    }

    std::sort(lst.begin(), lst.end());
    int cnt = 0, res = 0;
    for (auto &&p : lst) {
      cnt += p[1];
      res = std::max(res, cnt);
    }

    return res;
  }
};
```