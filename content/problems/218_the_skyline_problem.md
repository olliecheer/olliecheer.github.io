---
tags:
  - scanning_line
---
![[problems/pictures/Pasted image 20240908190941.png]]
![[problems/pictures/Pasted image 20240908190951.png]]


```c++
class Solution {  
public:  
  vec<vec<int>> getSkyline(vec<vec<int>> &buildings) {  
    auto cmp = [](const std::pair<int, int> &a, const std::pair<int, int> &b) {  
      return a.second < b.second;  
    };  
  
    std::priority_queue<std::pair<int, int>, vec<std::pair<int, int>>,  
                        decltype(cmp)>  
        que(cmp);  
  
    vec<int> boundaries;  
    for (auto &building : buildings) {  
      boundaries.emplace_back(building[0]);  
      boundaries.emplace_back(building[1]);  
    }  
    std::sort(boundaries.begin(), boundaries.end());  
  
    vec<vec<int>> ret;  
  
    int n = buildings.size(), i = 0;  
    for (auto &boundary : boundaries) {  
      for (; i < n && buildings[i][0] <= boundary; i++) {  
        que.emplace(buildings[i][1], buildings[i][2]);  
      }  
      while (!que.empty() && que.top().first <= boundary) {  
        que.pop();  
      }  
  
      int maxn = que.empty() ? 0 : que.top().second;  
      if (ret.empty() || maxn != ret.back()[1]) {  
        ret.push_back({boundary, maxn});  
      }  
    }  
    return ret;  
  }  
};
```