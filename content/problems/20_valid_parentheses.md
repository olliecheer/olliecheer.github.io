---
tags:
  - stack
  - parentheses
---
![[pictures/Pasted image 20241012195240.png]]
![[pictures/Pasted image 20241012195249.png]]


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
