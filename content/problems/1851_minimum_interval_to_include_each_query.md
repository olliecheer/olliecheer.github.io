---
tags:
  - priority_queue
---
![[problems/pictures/Pasted image 20240910020644.png]]
![[problems/pictures/Pasted image 20240910020653.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> minInterval(vec<vec<int>> &intervals, vec<int> &queries) {
    vec<int> qindex(queries.size());
    iota(qindex.begin(), qindex.end(), 0);
    sort(qindex.begin(), qindex.end(),
         [&](int i, int j) -> bool { return queries[i] < queries[j]; });
    sort(intervals.begin(), intervals.end(),
         [](const vec<int> &it1, const vec<int> &it2) -> bool {
           return it1[0] < it2[0];
         });
    priority_queue<vec<int>> pq;
    vec<int> res(queries.size(), -1);
    int i = 0;
    for (auto qi : qindex) {
      while (i < intervals.size() && intervals[i][0] <= queries[qi]) {
        int l = intervals[i][1] - intervals[i][0] + 1;
        pq.push({-l, intervals[i][0], intervals[i][1]});
        i++;
      }
      while (!pq.empty() && pq.top()[2] < queries[qi])
        pq.pop();

      if (!pq.empty())
        res[qi] = -pq.top()[0];
    }
    return res;
  }
};
```