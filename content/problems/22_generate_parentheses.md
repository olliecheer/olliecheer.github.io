---
tags:
  - parentheses
  - combination
  - dfs
  - backtrack
---


![[problems/pictures/Pasted image 20240907222924.png]]


```c++
class Solution {  
  void backtrack(vec<std::string> &res, std::string cur, int open, int close,  
                 int max) {  
    if (cur.size() == max * 2) {  
      res.push_back(cur);      return;  
    }  
    if (open < max) {  
      cur.push_back('(');  
      backtrack(res, cur, open + 1, close, max);  
      cur.pop_back();    }  
    if (close < open) {  
      cur.push_back(')');  
      backtrack(res, cur, open, close + 1, max);  
      cur.pop_back();    }  }  
public:  
  vec<std::string> generateParenthesis(int n) {  
    vec<std::string> res;    backtrack(res, {}, 0, 0, n);  
    return res;  
  }};
```


```c++
class Solution_2 {  
  void dfs(int left, int right, std::string level, vec<std::string> &res) {  
    if (left > right)  
      return;  
  
    if (left == 0 && right == 0)  
      res.push_back(level);  
    if (left > 0)  
      dfs(left - 1, right, level + "(", res);  
  
    if (right > 0)  
      dfs(left, right - 1, level + ")", res);  
  }  
public:  
  vec<std::string> generateParenthesis(int n) {  
    vec<std::string> res;    dfs(n, n, "", res);  
    return res;  
  }};
```

