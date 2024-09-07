---
tags:
  - stack
  - parentheses
---

![[problems/pictures/Pasted image 20240907193817.png]]


```c++
class Solution {  
public:  
  bool isValid(std::string s) {  
    std::stack<char> stk;  
  
    for (char c : s) {  
      if (c == '(' || c == '[' || c == '{') {  
        stk.push(c);  
      } else if (c == ')') {  
        if (stk.empty() || stk.top() != '(')  
          return false;  
        else  
          stk.pop();  
      } else if (c == ']') {  
        if (stk.empty() || stk.top() != '[')  
          return false;  
        else  
          stk.pop();  
      } else if (c == '}') {  
        if (stk.empty() || stk.top() != '{')  
          return false;  
        else  
          stk.pop();  
      }  
    }  
  
    return stk.empty();  
  }  
};
```
