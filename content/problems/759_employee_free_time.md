---
tags:
  - priority_queue
---
![[problems/pictures/Pasted image 20241012092043.png]]


```c++
struct Interval {
  int start;
  int end;
  Interval(int _start, int _end) {
    start = _start;
    end = _end;
  }
};

template <typename T> using vec = std::vector<T>;

class Solution {

public:
  vec<Interval> employeeFreeTime(vec<vec<Interval>> schedule) {
    vec<Interval> res;

    auto pq_comp = [](auto &a, auto &b) {
      return std::greater{}(a.start, b.start);
    };
    std::priority_queue<Interval, vec<Interval>, decltype(pq_comp)> pq(pq_comp);

    for (auto &it : schedule)
      for (auto i : it)
        pq.push(i);

    auto cur = pq.top();
    pq.pop();
    while (!pq.empty()) {
      if (cur.end >= pq.top().start) {
        cur.end = std::max(cur.end, pq.top().end);
        pq.pop();
      } else {
        res.emplace_back(cur.end, pq.top().start);
        cur = pq.top();
        pq.pop();
      }
    }

    return res;
  }
};
```