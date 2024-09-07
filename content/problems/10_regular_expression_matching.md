---
tags:
  - dfs
  - regular_expression
  - recursion
---
![[problems/pictures/Pasted image 20240907192757.png]]


### DFS
```c++
class Solution_dfs {  
  vec<vec<std::optional<bool>>> memo;  
  
  bool dfs(std::string &s, std::string &p, int i, int j) {  
    if (memo[i][j]) {  
      memo[i][j] = true;  
      return true;  
    }  
  
    bool res;  
    if (j == p.size())  
      res = (i == s.size());  
    else {  
      bool first_match = (i < s.size() && (p[j] == s[i] || p[j] == '.'));  
      if (j + 1 < p.size() && p[j + 1] == '*') {  
        bool star_match_null = dfs(s, p, i + 1, j);  
        bool star_match_str = first_match && dfs(s, p, i + 1, j);  
        res = star_match_null || star_match_str;  
      } else  
        res = first_match && dfs(s, p, i + 1, j + 1);  
    }  
  
    memo[i][j] = res;  
    return res;  
  }  
  
public:  
  bool isMatch(std::string s, std::string p) {  
    memo = {s.size() + 1, {p.size() + 1}};  
    return dfs(s, p, 0, 0);  
  }  
};
```


### recursion
```c++
class Solution {  
public:  
  bool isMatch(std::string s, std::string p) {  
    if (p.empty())  
      return s.empty();  
  
    bool firstMatch = !s.empty() && (s[0] == p[0] || p[0] == '.');  
    if (p.size() >= 2 && p[1] == '*') {  
      bool star_match_null = isMatch(s, p.substr(2));  
      bool star_match_str = firstMatch && isMatch(s.substr(1), p);  
      return star_match_null || star_match_str;  
    } else {  
      return firstMatch && isMatch(s.substr(1), p.substr(1));  
    }  
  }  
};
```