---
tags:
---
![[problems/pictures/Pasted image 20240910011335.png]]


```c++
class Solution {  
public:  
  int removeCorveredIntervals(vec<vec<int>> &intervals) {  
    std::sort(intervals.begin(), intervals.end(), [](vec<int> &a, vec<int> &b) {  
      if (a[0] == b[0])  
        return a[1] > b[1];  
      else  
        return a[0] < b[0];  
    });  
  
    int count = 0, cur = 0;  
    for (auto &&it : intervals) {  
      if (cur < it[1]) {  
        cur = it[1];  
        count++;  
      }  
    }  
  
    return count;  
  }  
};
```