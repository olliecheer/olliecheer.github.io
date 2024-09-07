---
tags:
  - array
  - interval
---
![[problems/pictures/Pasted image 20240907233436.png]]

```c++
class Solution {  
  vec<vec<int>> merge(vec<vec<int>> &intervals) {  
    auto res = vec<vec<int>>{};  
    std::sort(intervals.begin(), intervals.end());  
  
    for (auto &it : intervals) {  
      if (res.empty() || it[0] > res.back()[1]) {  
        res.push_back(it);  
      } else if (it[1] > res.back()[1]) {  
        res.back()[1] = it[1];  
      }  
    }  
  
    return res;  
  }  
};
```
