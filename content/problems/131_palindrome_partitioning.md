---
tags:
  - palindrome
---
![[problems/pictures/Pasted image 20240908031138.png]]

```c++
class Solution {  
  bool is_palindrome(std::string &s) {  
    int i = 0, j = s.size() - 1;  
    while (i < j) {  
      if (s[i] != s[j])  
        return false;  
  
      i++;  
      j--;  
    }  
  
    return true;  
  }  
  
  void dfs(std::string &s, int start, vec<std::string> &level,  
           vec<vec<std::string>> &res) {  
    if (start >= s.size()) {  
      res.push_back({level});  
      return;  
    }  
  
    for (int i = start; i < s.size(); i++) {  
      auto substring = s.substr(start, i + 1 - start);  
      if (is_palindrome(substring)) {  
        level.push_back(substring);  
        dfs(s, i + 1, level, res);  
        level.pop_back();  
      }  
    }  
  }  
  
public:  
  vec<vec<std::string>> partition(std::string &s) {  
    vec<vec<std::string>> res;  
    vec<std::string> level;  
    dfs(s, 0, level, res);  
    return res;  
  }  
};
```


```c++
class Solution_preprocess {  
  void backtrack(vec<vec<std::string>> &res, vec<std::string> &path,  
                 vec<vec<bool>> &dp, std::string &s, int pos) {  
    if (pos == s.size()) {  
      res.push_back({path});  
      return;  
    }  
  
    for (int i = pos; i < s.size(); i++) {  
      if (dp[pos][i]) {  
        path.push_back(s.substr(pos, i + 1 - pos));  
        backtrack(res, path, dp, s, i + 1);  
        path.pop_back();  
      }  
    }  
  }  
  
public:  
  vec<vec<std::string>> partition(std::string &s) {  
    vec<vec<std::string>> res;  
    int N = s.size();  
    vec<vec<bool>> dp(N, vec<bool>(N));  
    for (int i = 0; i < N; i++) {  
      for (int j = 0; j <= i; j++) {  
        if (s[i] == s[j] && (i - j <= 2 || dp[j + 1][i - 1]))  
          dp[i][j] = true;  
      }  
    }  
  
    vec<std::string> path;  
    backtrack(res, path, dp, s, 0);  
    return res;  
  }  
};
```


