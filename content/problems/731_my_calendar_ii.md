---
tags:
  - calendar
  - scanning_line
---
![[pictures/Pasted image 20241012084349.png]]
![[pictures/Pasted image 20241012084402.png]]

### Scanning Line

```c++
template <typename T> using vec = std::vector<T>;

class MyCalendarTwo {
  std::map<int, int> delta;

public:
  bool book(int start, int end) {
    delta[start]++;
    delta[end]--;

    int active = 0;
    for (auto it : delta) {
      int k = it.first;
      int v = it.second;
      active += v;
      if (active >= 3) {
        delta[start]--;
        delta[end]++;
        if (delta[start] == 0)
          delta.erase(start);

        return false;
      }
    }
    return true;
  }
};
```


### Double Compare

```c++
template <typename T> using vec = std::vector<T>;

class MyCalendarTwo {
  vec<vec<int>> calendar, overlaps;

public:
  bool book(int start, int end) {
    for (auto &&overlap : overlaps)
      if (start < overlap[1] && end > overlap[0])
        return false;

    for (auto &&interval : calendar)
      if (start < interval[1] && end > interval[0])
        overlaps.push_back(
            {std::max(start, interval[0]), std::min(end, interval[1])});

    calendar.push_back({start, end});
    return true;
  }
};
```
