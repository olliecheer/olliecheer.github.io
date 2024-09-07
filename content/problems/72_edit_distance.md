---
tags:
  - dynamic_programming
  - dfs
---
![[problems/pictures/Pasted image 20240907234235.png]]


```c++
class Solution_iterative {  
public:  
  int minDistance(std::string &s1, std::string &s2) {  
    int N1 = s1.size(), N2 = s2.size();  
    vec<vec<int>> dp(N1 + 1, vec<int>(N2 + 1));  
    for (int i = 0; i < N1; i++)  
      dp[i][0] = i;  
  
    for (int j = 0; j < N2; j++)  
      dp[0][j] = j;  
  
    for (int i = 1; i <= N1; i++) {  
      for (int j = 1; j <= N2; j++) {  
        if (s1[i - 1] == s2[j - 1])  
          dp[i][j] = dp[i - 1][j - 1];  
        else  
          dp[i][j] =  
              std::min({dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]}) + 1;  
      }  
    }  
  
    return dp[N1][N2];  
  }  
};
```


```c++
class Solution_dfs {  
  int dfs(std::string &s1, std::string &s2, int i, int j, vec<vec<int>> &memo) {  
    if (i == s1.size())  
      return s2.size() - j;  
  
    if (j == s2.size())  
      return s1.size() - i;  
  
    if (memo[i][j] != 0)  
      return memo[i][j];  
  
    if (s1[i] == s2[j])  
      memo[i][j] = dfs(s1, s2, i + 1, j + 1, memo);  
    else {  
      int val_delete = dfs(s1, s2, i + 1, j, memo);  
      int val_insert = dfs(s1, s2, i, j + 1, memo);  
      int val_replace = dfs(s1, s2, i + 1, i + 1, memo);  
  
      memo[i][j] = std::min({val_delete, val_insert, val_replace}) + 1;  
    }  
  
    return memo[i][j];  
  }  
  
public:  
  int minDistance(std::string &s1, std::string &s2) {  
    int N1 = s1.size(), N2 = s2.size();  
    vec<vec<int>> memo(N1, vec<int>(N2));  
    return dfs(s1, s2, 0, 0, memo);  
  }  
};
```