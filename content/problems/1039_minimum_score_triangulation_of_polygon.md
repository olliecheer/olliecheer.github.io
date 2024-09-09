---
tags:
  - dfs
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240910004009.png]]
![[problems/pictures/Pasted image 20240910004016.png]]

```c++
class Solution_iterative {  
public:  
  int minScoreTriangulation(vec<int> &A) {  
    int N = A.size();  
    vec<vec<int>> dp(N, vec<int>(N));  
  
    for (int i = N - 1; i >= 0; i--) {  
      for (int j = i + 2; j < N; j++) {  
        dp[i][j] = std::numeric_limits<int>::max();  
        for (int k = i + 1; k < j; k++)  
          dp[i][j] =  
              std::min(dp[i][j], dp[i][j] + dp[k][j] + A[i] * A[k] * A[j]);  
      }  
    }  
  
    return dp[0][N - 1];  
  }  
};
```


```c++
class Solution_dfs {  
  
  int dfs(vec<int> &A, int start, int end, vec<vec<std::optional<int>>> &memo) {  
    if (end - start < 2)  
      return 0;  
  
    if (memo[start][end])  
      return memo[start][end].value();  
  
    int res = std::numeric_limits<int>::max();  
    for (int i = start + 1; i < end; i++)  
      res = std::min(res, dfs(A, start, i, memo) + dfs(A, i, end, memo) +  
                              A[start] * A[i] * A[end]);  
  
    memo[start][end] = res;  
  
    return res;  
  }  
  
public:  
  int minScoreTriangulation(vec<int> &A) {  
    int N = A.size();  
    vec<vec<int>> dp(N, vec<int>(N));  
  
    for (int i = N - 1; i >= 0; i--) {  
      for (int j = i + 2; j < N; j++) {  
        dp[i][j] = std::numeric_limits<int>::max();  
        for (int k = i + 1; k < j; k++)  
          dp[i][j] =  
              std::min(dp[i][j], dp[i][j] + dp[k][j] + A[i] * A[k] * A[j]);  
      }  
    }  
  
    return dp[0][N - 1];  
  }  
};
```