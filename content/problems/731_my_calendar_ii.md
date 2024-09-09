---
tags:
  - calendar
  - scanning_line
---
![[problems/pictures/Pasted image 20240909233012.png]]
![[problems/pictures/Pasted image 20240909233024.png]]

```c++
class Solution_scanning_line {  
  std::unordered_map<int, int> delta;  
  
public:  
  bool book(int start, int end) {  
    delta.insert({start, delta[start] + 1});  
    delta.insert({end, delta[end] - 1});  
  
    int active = 0;  
    for (auto it : delta) {  
      int k = it.first;  
      int v = it.second;  
      active += v;  
      if (active >= 3) {  
        delta.insert({start, delta[start] - 1});  
        delta.insert({end, delta[end] + 1});  
        if (delta[start] == 0)  
          delta.erase(start);  
  
        return false;  
      }  
    }  
    return false;  
  }  
};
```


```c++
class Solution_double_compare {  
  vec<vec<int>> calendar, overlaps;  
  
public:  
  bool book(int start, int end) {  
    for (auto &&overlap : overlaps) {  
      if (start < overlap[1] && end > overlap[0])  
        return false;  
    }  
    for (auto &&interval : calendar) {  
      if (start < interval[1] && end > interval[0]) {  
        overlaps.push_back(  
            {std::max(start, interval[0]), std::min(end, interval[1])});  
      }  
    }  
  
    calendar.push_back({start, end});  
    return true;  
  }  
};
```