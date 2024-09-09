---
tags:
---
![[problems/pictures/Pasted image 20240909222422.png]]

```c++
class Solution {  
public:  
  int eraseOverlapIntervals(vec<vec<int>> &intervals) {  
    if (intervals.empty())  
      return 0;  
  
    std::sort(intervals.begin(), intervals.end());  
    int count = 0;  
    int end = std::numeric_limits<int>::min();  
  
    for (auto &&it : intervals) {  
      if (end <= it[0])  
        end = it[1];  
      else  
        count++;  
    }  
  
    return count;  
  }  
};
```