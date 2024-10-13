---
tags:
  - meeting_room
---
![[pictures/Pasted image 20241014001915.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minMeetingRooms(vec<vec<int>> intervals) {
    vec<vec<int>> vec;
    for (auto &&interval : intervals) {
      vec.push_back({interval[0], 1});
      vec.push_back({interval[1], -1});
    }

    std::sort(vec.begin(), vec.end());
    int res = 0, count = 0;
    for (auto &p : vec) {
      count += p[1];
      res = std::max(res, count);
    }

    return res;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minMeetingRooms(vec<vec<int>> &intervals) {
    std::sort(intervals.begin(), intervals.end());

    auto pq_comp = [](vec<int> &a, vec<int> &b) { return a[1] > b[1]; };

    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);
    pq.push(intervals[0]);

    for (int i = 1; i < intervals.size(); i++) {
      auto cur = pq.top();
      pq.pop();
      if (cur[1] <= intervals[i][0])
        cur[1] = intervals[i][1];
      else
        pq.push(intervals[i]);

      pq.push(cur);
    }

    return pq.size();
  }
};
```