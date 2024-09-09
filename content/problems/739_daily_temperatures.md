---
tags:
  - mono_stack
---

![[problems/pictures/Pasted image 20240910000209.png]]

```c++
class Solution {  
public:  
  vec<int> dailyTemperatures(vec<int> &temperatures) {  
    int N = temperatures.size();  
    vec<int> res;  
    std::stack<int> stk;  
  
    for (int i = 0; i < N; i++) {  
      int cur = temperatures[i];  
      while (!stk.empty() && temperatures[stk.top()] < cur) {  
        int prev = stk.top();  
        stk.pop();  
        res[prev] = cur - prev;  
      }  
      stk.push(cur);  
    }  
  
    return res;  
  }  
};
```