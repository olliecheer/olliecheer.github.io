---
tags:
---
![[problems/pictures/Pasted image 20240909220605.png]]
![[problems/pictures/Pasted image 20240909220619.png]]
![[problems/pictures/Pasted image 20240909220704.png]]

```c++
struct Interval {  
  int begin;  
  int end;  
};

class Solution {  
public:  
  int countOfAirplanes(vec<Interval> &airplanes) {  
    vec<std::pair<int, int>> vec;  
    for (auto &interval : airplanes) {  
      vec.push_back({interval.begin, 0});  
      vec.push_back({interval.end, 0});  
    }  
  
    std::sort(vec.begin(), vec.end(),  
              [](auto &&a, auto &&b) { return a.first < b.first; });  
  
    int cnt = 0, res = 0;  
    for (auto &&p : vec) {  
      if (p.second == 0) {  
        cnt++;  
      } else if (p.second == 1) {  
        cnt--;  
      }  
  
      res = std::max(res, cnt);  
    }  
  
    return res;  
  }  
};
```