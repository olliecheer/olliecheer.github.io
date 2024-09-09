---
tags:
---

![[problems/pictures/Pasted image 20240910023703.png]]
![[problems/pictures/Pasted image 20240910023715.png]]


```c++
class Solution {  
public:  
  vec<int> survivedRobotsHealths(vec<int> &position, vec<int> h,  
                                 std::string &direction) {  
    int N = position.size();  
    vec<int> ind;  
    for (int i = 0; i < N; i++)  
      ind.push_back(i);  
  
    std::sort(ind.begin(), ind.end(),  
              [&position](int a, int b) { return position[a] < position[b]; });  
  
    std::stack<int> stk;  
    for (int i : ind) {  
      if (direction[i] == 'R') {  
        stk.push(i);  
        continue;  
      }  
  
      while (!stk.empty() && h[i] > 0) {  
        if (h[stk.top()] < h[i]) {  
          h[stk.top()] = 0;  
          stk.pop();  
          h[i]--;  
        } else if (h[stk.top()] > h[i]) {  
          h[stk.top()]--;  
          h[i] = 0;  
        } else {  
          h[stk.top()] = 0;  
          h[i] = 0;  
        }  
      }  
    }  
  
    vec<int> res;  
    for (int v : h) {  
      if (v > 0)  
        res.push_back(v);  
    }  
  
    return res;  
  }  
};
```