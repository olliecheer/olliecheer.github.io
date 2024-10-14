---
tags:
  - dynamic_programming
---
![[problems/pictures/Pasted image 20241013231306.png]]
![[problems/pictures/Pasted image 20241013231326.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int carFleet(int target, vec<int> position, vec<int> speed) {
    std::map<int, double> mp;
    for (int i = 0; i < position.size(); i++)
      mp[-position[i]] = ((double)(target - position[i])) / speed[i];

    int res = 0;
    double prev = -1;
    for (auto& it : mp) {
      double tm = it.second;
      if (tm > prev) {
        prev = tm;
        res++;
      }
    }

    return res;
  }
};
```