---
tags:
  - parentheses
---
![[problems/pictures/Pasted image 20240909210936.png]]

```c++
class Solution {  
  void dfs(std::string &s, int i, std::unordered_set<std::string> &res,  
           std::string &tmp, int rml, int rmr, int open) {  
    if (rml < 0 || rmr < 0 || open < 0)  
      return;  
  
    if (i == s.size()) {  
      if (rml == 0 && rmr == 0 && open == 0) {  
        res.insert(tmp);  
        return;  
      }  
    }  
    char c = s[i];  
    int len = tmp.size();  
    if (c == '(') {  
      dfs(s, i + 1, res, tmp, rml - 1, rmr, open);  
      tmp.push_back(c);  
      dfs(s, i + 1, res, tmp, rml, rmr, open + 1);  
    } else if (c == ')') {  
      dfs(s, i + 1, res, tmp, rml, rmr - 1, open);  
      tmp.push_back(c);  
      dfs(s, i + 1, res, tmp, rml, rmr, open - 1);  
    } else {  
      tmp.push_back(c);  
      dfs(s, i + 1, res, tmp, rml, rmr, open);  
    }  
  
    tmp.resize(len);  
  }  
  
public:  
  vec<std::string> removeInvalidParentheses(std::string &s) {  
    int rml = 0, rmr = 0;  
    for (char c : s) {  
      if (c == '(')  
        rml++;  
      else if (c == ')') {  
        if (rml != 0)  
          rml--;  
        else  
          rmr++;  
      }  
    }  
  
    std::unordered_set<std::string> res;  
    std::string tmp;  
    dfs(s, 0, res, tmp, rml, rmr, 0);  
  
    return {res.begin(), res.end()};  
  }  
};
```