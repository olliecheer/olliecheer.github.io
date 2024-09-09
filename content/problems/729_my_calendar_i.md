---
tags:
  - calendar
---
![[problems/pictures/Pasted image 20240909232914.png]]

```c++
class MyCalendar {  
  vec<vec<int>> calendar;  
  
public:  
  bool book(int start, int end) {  
    for (auto &&it : calendar) {  
      if (it[0] < end && start < it[1])  
        return false;  
    }  
  
    calendar.push_back({start, end});  
    return true;  
  }  
};  
```


```c++
class MyCalendar_2 {  
  std::map<int, int> calendar;  
  
public:  
  bool book(int start, int end) {  
    int prev = calendar.floorKey(start);  
    int next = calendar.ceilingKey(start);  
  
    if ((prev == nullptr || calendar[prev] <= start) &&  
        (next == nullptr || end <= next)) {  
      calendar.insert({start, end});  
      return true;  
    }  
    return false;  
  }  
};
```