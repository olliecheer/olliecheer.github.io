---
tags:
  - parentheses
---
![[pictures/Pasted image 20241013231240.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int scoreOfParentheses(std::string &s) {
    std::stack<int> stk;
    stk.push(0);
    for (char c : s) {
      if (c == '(')
        stk.push(0);
      else {
        int v = stk.top();
        stk.pop();
        int w = stk.top();
        stk.pop();

        stk.push(w + std::max(2 * v, 1));
      }
    }

    return stk.top();
  }
};
```