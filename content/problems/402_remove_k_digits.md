---
tags:
  - stack
---
![[pictures/Pasted image 20241014005431.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  std::string removeKdigits(std::string &num, int k) {
    std::deque<char> stk;
    for (char c : num) {
      while (!stk.empty() && k > 0 && c < stk.back()) {
        stk.pop_back();
        k--;
      }

      stk.push_back(c);
    }

    while (k > 0) {
      k--;
      stk.pop_back();
    }

    std::string res;
    bool leading_zero = true;
    for (auto c : stk) {
      if (c == '0' && leading_zero)
        continue;
      else
        leading_zero = false;
      res.push_back(c);
    }

    return res.empty() ? "0" : res;
  }
};
```