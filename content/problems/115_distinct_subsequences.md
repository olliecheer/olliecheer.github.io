---
tags:
  - subsequence
  - dfs
  - recursion
  - iteration
---
![[problems/pictures/Pasted image 20240908025529.png]]


```c++
class Solution_iterative {  
public:  
  int numDistinct(std::string &s, std::string &t) {  
    vec<vec<int>> dp(s.size() + 1, vec<int>(t.size() + 1));  
    for (int i = 0; i < s.size() + 1; i++)  
      dp[i][0] = 1;  
  
    for (int i = 1; i < s.size() + 1; i++) {  
      for (int j = 1; j < t.size() + 1; j++) {  
        if (s[i - 1] == t[j - 1])  
          dp[i][j] = dp[i - 1][j] + dp[i - 1][j - 1];  
        else  
          dp[i][j] = dp[i - 1][j];  
      }  
    }  
  
    return dp[s.size()][t.size()];  
  }  
};
```



```c++
class Solution_dfs {  
  int dfs(std::string &s, std::string &t, int i, int j, vec<vec<int>> &memo) {  
    if (j >= t.size())  
      return 1;  
    if (i >= s.size())  
      return 0;  
  
    if (memo[i][j] != -1)  
      return memo[i][j];  
  
    int subsequence = dfs(s, t, i + 1, j, memo);  
    if (s[i] == t[j])  
      subsequence += dfs(s, t, i + 1, j + 1, s, t);  
  
    memo[i][j] = subsequence;  
    return subsequence;  
  }  
  
public:  
  int numDistinct(std::string &s, std::string &t) {  
    vec<vec<int>> memo(s.size(), vec<int>(t.size(), -1));  
    return dfs(s, t, 0, 0, memo);  
  }  
};
```