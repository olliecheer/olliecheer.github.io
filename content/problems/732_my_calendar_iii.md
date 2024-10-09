---
tags:
  - calendar
---
![[problems/pictures/Pasted image 20240909233136.png]]

```c++
template <typename T> using vec = std::vector<T>;

class MyCalendarThree {
  std::map<int, int> mp;

public:
  int book(int start, int end) {
    mp[start]++;
    mp[end]--;
    int sum = 0, res = 0;
    for (auto &&it : mp) {
      int k = it.first;
      int v = it.second;
      sum += v;
      res = std::max(res, sum);
    }

    return res;
  }
};
```
