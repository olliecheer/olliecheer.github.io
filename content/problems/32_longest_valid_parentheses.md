---
tags:
  - parentheses
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
  
    return 0;  
  }  
};
```


```c++
class Solution_2 {  
public:  
  int longestValidParentheses(std::string &s) {  
    int cntl = 0, cntr = 0, res = 0;  
  
    for (char c : s) {  
      if (c == '(')  
        cntl++;  
      else  
        cntr++;  
  
      if (cntl == cntr) {  
        res = std::max(res, 2 * cntl);  
      } else if (cntr > cntl) {  
        cntl = 0;  
        cntr = 1;  
      }  
    }  
  
    cntl = 0;  
    cntr = 0;  
  
    for (int i = s.size() - 1; i >= 0; i--) {  
      if (s[i] == '(')  
        cntl++;  
      else  
        cntr++;  
  
      if (cntl == cntr)  
        res = std::max(res, 2 * cntl);  
      else if (cntl > cntr) {  
        cntl = 0;  
        cntr = 0;  
      }  
    }  
  
    return res;  
  }  
};
```

