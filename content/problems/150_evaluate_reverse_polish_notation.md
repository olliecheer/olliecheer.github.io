---
tags:
  - stack
---
![[problems/pictures/Pasted image 20241013234651.png]]
![[problems/pictures/Pasted image 20241013234659.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int evalRPN(vec<std::string> &token) {
    if (token.empty())
      return 0;

    int N = token.size();
    std::stack<int> stk;

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
      } else {
        stk.push(std::stoi(t));
      }
    }
    return stk.top();
  }
};
```