---
tags:
  - parentheses
---
![[pictures/Pasted image 20241013225020.png]]
![[pictures/Pasted image 20241013225040.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maxDepth(std::string s) {
    int res = 0, count = 0;
    for (char c : s) {
      if (c == '(')
        count++;
      else if (c == ')')
        count--;
      res = std::max(res, count);
    }

    return res;
  }
};
```