---
tags:
  - parentheses
---
![[problems/pictures/Pasted image 20241013201504.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minAddToMakeValid(std::string &s) {
    int left = 0, right = 0;
    for (int i = 0; i < s.size(); i++) {
      if (s[i] == '(')
        right++;

      if (s[i] == ')') {
        if (right > 0)
          right--;
        else
          left++;
      }
    }

    return left + right;
  }
};
```