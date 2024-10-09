---
tags:
  - mono_stack
---

![[problems/pictures/Pasted image 20240910000209.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> dailyTemperatures(vec<int> &temperatures) {
    int N = temperatures.size();
    vec<int> res(N);
    std::stack<int> stk;

    for (int i = N - 1; i >= 0; i--) {
      while (!stk.empty() && temperatures[i] >= temperatures[stk.top()])
        stk.pop();

      res[i] = stk.empty() ? 0 : stk.top() - i;
      stk.push(i);
    }

    return res;
  }
};
```
