---
tags:
  - path
  - sum
  - dfs
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240910011429.png]]
![[problems/pictures/Pasted image 20240910011437.png]]


```c++
class Solution {  
public:  
  int minFallingPathSum(vec<vec<int>> &arr) {  
    int M = arr.size(), N = arr[0].size();  
    vec<vec<int>> dp(M, vec<int>(N));  
    for (int i = 0; i < N; i++)  
      dp[0][i] = arr[0][i];  
  
    for (int i = 1; i < M; i++) {  
      for (int j = 0; j < N; j++) {  
        int prev_row_min = std::numeric_limits<int>::max();  
        for (int k = 0; k < N; k++) {  
          if (j != k)  
            prev_row_min = std::min(prev_row_min, dp[i - 1][k]);  
        }  
        dp[i][j] = arr[i][j] + prev_row_min;  
      }  
    }  
  
    int res = std::numeric_limits<int>::max();  
    for (int i = 0; i < N; i++)  
      res = std::min(res, dp[M - 1][i]);  
  
    return res;  
  }  
};
```


```c++
class Solution_dfs {  
  int dfs(vec<vec<int>> &arr, int i, int k, vec<vec<int>> &memo) {  
    int M = arr.size(), N = arr[0].size();  
  
    if (memo[i][k] != -1)  
      return memo[i][k];  
  
    int min_value = std::numeric_limits<int>::max();  
    for (int j = 0; j < N; j++) {  
      if (j != k)  
        min_value = std::min(min_value, dfs(arr, i + 1, j, memo));  
    }  
  
    memo[i][k] = min_value + arr[i][k];  
    return memo[i][k];  
  }  
  
public:  
  int minFallingPathSum(vec<vec<int>> &arr) {  
    int M = arr.size(), N = arr[0].size();  
    vec<vec<int>> memo(M, vec<int>(N, -1));  
    int res = std::numeric_limits<int>::max();  
    for (int i = 0; i < N; i++)  
      res = std::min(res, dfs(arr, 0, i, memo));  
  
    return res;  
  }  
};
```