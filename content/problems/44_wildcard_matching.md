---
tags:
  - regular_expression
  - dynamic_programming
  - dfs
---
![[problems/pictures/Pasted image 20240907224338.png]]

```c++
class Solution_dp {  
public:  
  bool isMatch(std::string &s, std::string &p) {  
    int M = s.size(), N = p.size();  
    vec<vec<bool>> dp(M + 1, vec<bool>(N + 1));  
    dp[M][N] = true;  
  
    for (int i = N - 1; i >= 0; i--) {  
      if (p[i - 1] == '*')  
        dp[0][i] = dp[0][i - 1];  
    }  
  
    for (int i = 1; i <= M; i++) {  
      for (int j = 1; j <= N; j++) {  
        if (p[j - 1] == s[i - 1] || p[j - 1] == '?')  
          dp[i][j] = dp[i - 1][j - 1];  
        else if (p[j - 1] == '*')  
          dp[i][j] = dp[i - 1][j] || dp[i][j - 1];  
      }  
    }  
  
    return dp[M][N];  
  }  
};
```


```c++
class Solution_dfs {  
  int dfs(std::string &s, std::string p, int i, int j, vec<vec<int>> &memo) {  
    if (memo[i][j] != -1)  
      return memo[i][j];  
  
    int res = 0;  
  
    if (s[i] == p[j] || p[j] == '?')  
      res = dfs(s, p, i + 1, j + 1, memo);  
    else if (p[j] == '*') {  
      int result_text = dfs(s, p, i + 1, j, memo);  
      int result_empty = dfs(s, p, i, j + 1, memo);  
      int result_plain_star = dfs(s, p, i + 1, j + 1, memo);  
      res = (result_text + result_empty + result_plain_star) > 0 ? 1 : 0;  
    } else  
      res = 0;  
  
    memo[i][j] = res;  
    return res;  
  }  
  
public:  
  bool isMatch(std::string &s, std::string &p) {  
    int M = s.size(), N = p.size();  
    vec<vec<int>> memo(M + 1, vec<int>(N + 1, -1));  
    memo[M][N] = true;  
  
    for (int i = N - 1; i >= 0; i--) {  
      if (p[i - 1] == '*')  
        memo[0][i] = memo[0][i - 1];  
      else  
        memo[0][i] = 0;  
    }  
  
    for (int i = 0; i < M; i++)  
      memo[i][N] = 0;  
  }  
};
```