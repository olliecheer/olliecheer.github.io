---
tags:
  - meeting_room
  - scanning_line
---
![[problems/pictures/Pasted image 20241014001846.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool canAttendMeetings(vec<vec<int>> &intervals) {
    if (intervals.empty())
      return true;

    std::sort(intervals.begin(), intervals.end());

    for (int i = 0; i < intervals.size() - 1; i++)
      if (intervals[i][1] > intervals[i + 1][0])
        return false;

    return true;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool canAttendMeetings(vec<vec<int>> intervals) {
    if (intervals.empty())
      return true;

    std::priority_queue<vec<int>, vec<vec<int>>, std::greater<vec<int>>> pq(
        std::greater<vec<int>>{});

    for (vec<int> &interval : intervals)
      pq.push(interval);

    auto prev = pq.top();
    pq.pop();

    for (int i = 1; i < intervals.size(); i++) {
      auto cur = pq.top();
      pq.pop();

      if (prev[1] > cur[0])
        return false;

      prev = cur;
    }

    return true;
  }
};
```