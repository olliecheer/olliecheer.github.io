---
tags:
  - stack
---
![[problems/pictures/Pasted image 20240909233319.png]]


```c++
class Solution {  
public:  
  vec<int> asteroidCollision(vec<int> &asteroids) {  
    std::stack<int> stk;  
    for (int cur : asteroids) {  
      if (cur > 0)  
        stk.push(cur);  
      else {  
        while (!stk.empty() && stk.top() > 0 && stk.top() + cur < 0)  
          stk.pop();  
  
        if (stk.empty() || stk.top() < 0)  
          stk.push(cur);  
        else if (stk.top() == -cur)  
          stk.pop();  
      }  
    }  
  
    vec<int> res(stk.size());  
    for (int i = res.size() - 1; i >= 0; i--) {  
      res[i] = stk.top();  
      stk.pop();  
    }  
  
    return res;  
  }  
};
```