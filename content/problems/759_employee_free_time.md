---
tags:
  - priority_queue
---

![[problems/pictures/Pasted image 20240910000601.png]]



```c++
class Solution {  
  using Interval = std::pair<int, int>;  
  
public:  
  vec<Interval> employeeFreeTime(vec<vec<Interval>> &schedule) {  
    vec<Interval> res;  
  
    std::priority_queue<Interval> pq;  
  
    for (auto &&it : schedule)  
      for (auto i : it)  
        pq.push(i);  
  
    auto cur = pq.top();  
    pq.pop();  
    while (!pq.empty()) {  
      if (cur.second >= pq.top().first) {  
        cur.second = std::max(cur.second, pq.top().second);  
        pq.pop();  
      } else {  
        res.emplace_back(cur.second, pq.top().first);  
        cur = pq.top();  
      }  
    }  
  
    return res;  
  }  
};
```