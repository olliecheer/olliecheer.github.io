---
tags:
  - calendar
---
![[problems/pictures/Pasted image 20241011100740.png]]
![[problems/pictures/Pasted image 20241011100749.png]]


```c++
template <typename T> using vec = std::vector<T>;

class MyCalendar {
  vec<vec<int>> calendar;

public:
  bool book(int start, int end) {
    for (auto &it : calendar)
      if (it[0] < end && start < it[1])
        return false;

    calendar.push_back({start, end});
    return true;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class MyCalendar {
  std::set<std::pair<int, int>> calendar;

public:
  bool book(int start, int end) {
    std::pair<int, int> evt{start, end};
    auto next_event = calendar.lower_bound(evt);
    if (next_event != calendar.end() && next_event->first < end)
      return false;

    if (next_event != calendar.begin()) {
      auto prev_event = std::prev(next_event);
      if (prev_event->second > start)
        return false;
    }

    calendar.insert(evt);
    return true;
  }
};
```
