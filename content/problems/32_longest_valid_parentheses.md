---
tags:
  - parentheses
  - longest_substring
  - stack
  - 2pass
---
![[problems/pictures/Pasted image 20240907223537.png]]

```c++
class Solution {
public:
  int longestValidParentheses(std::string &s) {
    int res = 0;
    std::stack<int> stk;
    stk.push(-1);
    for (int i = 0; i < s.size(); i++) {
      if (s[i] == '(')
        stk.push(i);
      else {
        stk.pop();
        if (stk.empty())
          stk.push(i);
        else
          res = std::max(res, i - stk.top());
      }
    }

    return res;
  }
};
```


```c++
class Solution {
public:
  int longestValidParentheses(std::string &s) {
    int res = 0;
    int count_left = 0, count_right = 0;

    for (char c : s) {
      if (c == '(')
        count_left++;
      else
        count_right++;

      if (count_left == count_right) {
        res = std::max(res, 2 * count_left);
      } else if (count_right > count_left) {
        count_left = 0;
        count_right = 0;
      }
    }

    count_left = 0;
    count_right = 0;

    for (int i = s.size() - 1; i >= 0; i--) {
      if (s[i] == '(')
        count_left++;
      else
        count_right++;

      if (count_left == count_right)
        res = std::max(res, 2 * count_left);
      else if (count_left > count_right) {
        count_left = 0;
        count_right = 0;
      }
    }

    return res;
  }
};
```

