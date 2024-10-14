---
tags:
  - stack
---
![[problems/pictures/Pasted image 20241012085328.png]]
![[problems/pictures/Pasted image 20241012085342.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> asteroidCollision(vec<int> &asteroids) {
    std::deque<int> stk;
    for (int cur : asteroids) {
      if (cur > 0)
        stk.push_back(cur);
      else {
        while (!stk.empty() && stk.back() > 0 && stk.back() + cur < 0)
          stk.pop_back();

        if (stk.empty() || stk.back() < 0)
          stk.push_back(cur);
        else if (stk.back() == -cur)
          stk.pop_back();
      }
    }

    return {stk.begin(), stk.end()};
  }
};
```
