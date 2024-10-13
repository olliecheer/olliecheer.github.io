---
tags:
  - calendar
---
![[pictures/Pasted image 20241012085023.png]]
![[pictures/Pasted image 20241012085039.png]]

```c++
template <typename T> using vec = std::vector<T>;

class MyCalendarThree {
  std::map<int, int> mp;

public:
  int book(int start, int end) {
    mp[start]++;
    mp[end]--;
    int sum = 0, res = 0;
    for (auto &it : mp) {
      int k = it.first;
      int v = it.second;
      sum += v;
      res = std::max(res, sum);
    }

    return res;
  }
};
```
