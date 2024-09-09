---
tags:
  - parentheses
---
![[problems/pictures/Pasted image 20240910001735.png]]

```c++
class Solution {  
public:  
  int scoreOfParentheses(std::string &s) {  
    std::stack<int> stk;  
    int cur = 0;  
    for (char c : s) {  
      if (c == '(') {  
        stk.push(cur);  
        cur = 0;  
      } else {  
        cur = stk.top() + std::max(cur * 2, 1);  
      }  
    }  
  
    return cur;  
  }  
};
```


```c++
class Solution_2 {  
public:  
  int scoreOfParentheses(std::string &s) {  
    std::stack<int> stk;  
    stk.push(0);  
    for (char c : s) {  
      if (c == '(') {  
        stk.push(0);  
      } else {  
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