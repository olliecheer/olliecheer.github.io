---
tags:
  - stack
---
![[problems/pictures/Pasted image 20240908181533.png]]
![[problems/pictures/Pasted image 20240908181541.png]]

```c++
class Solution {  
public:  
  int evalRPN(vec<std::string> &token) {  
    if (token.empty())  
      return 0;  
  
    std::stack<int> stk;  
    int N = token.size();  
  
    for (int i = 0; i < N; i++) {  
      auto const &t = token[i];  
      if (t == "+" || t == "-" || t == "*" || t == "/") {  
        int tmp2 = stk.top();  
        stk.pop();  
        int tmp1 = stk.top();  
        stk.pop();  
        int res = 0;  
        if (t == "+")  
          res = tmp1 + tmp2;  
        else if (t == "-")  
          res = tmp1 - tmp2;  
        else if (t == "*")  
          res = tmp1 * tmp2;  
        else if (t == "/")  
          res = tmp1 / tmp2;  
  
        stk.push(res);  
      }  
    }  
    return stk.top();  
  }  
};
```