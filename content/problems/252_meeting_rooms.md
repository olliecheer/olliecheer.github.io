---
tags:
  - meeting_room
  - scanning_line
---
![[problems/pictures/Pasted image 20240908210726.png]]

```c++
class Solution {  
public:  
  bool canAttendMeetings(vec<vec<int>> &intervals) {  
    if (intervals.empty())  
      return true;  
  
    std::sort(intervals.begin(), intervals.end(),  
              [](auto &&a, auto &&b) { return a[0] < b[0]; });  
  
    for (int i = 0; i < intervals.size() - 1; i++) {  
      if (intervals[i][1] > intervals[i + 1][0])  
        return false;  
    }  
  
    return true;  
  }  
};
```


```c++
class Solution_priority_queue {  
public:  
  bool canAttendMeetings(vec<vec<int>> intervals) {  
    if (intervals.empty())  
      return true;  
  
    auto comp = [](vec<int> const &a, vec<int> const &b) {  
      return a[0] > b[0];  
    };  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(comp)> pq(comp);  
  
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
  }  
};
```