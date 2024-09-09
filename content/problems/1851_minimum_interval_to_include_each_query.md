---
tags:
  - priority_queue
---
![[problems/pictures/Pasted image 20240910020644.png]]
![[problems/pictures/Pasted image 20240910020653.png]]

```c++
class Solution {  
public:  
  vec<int> minInterval(vec<vec<int>> &intervals, vec<int> queries) {  
    std::sort(intervals.begin(), intervals.end());  
    vec<vec<int>> q(queries.size(), vec<int>(2));  
    for (int i = 0; i < queries.size(); i++)  
      q[i] = {i, queries[i]};  
  
    std::sort(q.begin(), q.end(), [](auto &a, auto &b) { return a[1] < b[1]; });  
  
    auto pq_comp = [](vec<int> &a, vec<int> &b) {  
      return a[1] - a[0] < b[1] - b[0];  
    };  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);  
  
    vec<int> res(queries.size());  
    //        int j = 0;  
    for (int i = 0, j = 0; i < q.size(); i++) {  
      int index = q[i][0];  
      int val = q[i][1];  
  
      while (j < intervals.size() && intervals[j][0] <= val) {  
        pq.push(intervals[j]);  
        j++;  
      }  
  
      while (!pq.empty() && pq.top()[1] < val)  
        pq.pop();  
  
      res[index] = pq.empty() ? -1 : pq.top()[1] - pq.top()[0] + 1;  
    }  
  
    return res;  
  }  
};
```