---
tags:
  - iteration
  - recursion
---


![[problems/pictures/Pasted image 20240908025919.png]]


```c++
class Solution_iterative {  
public:  
  int minimumtotal(vec<vec<int>> &triangle) {  
    int N = triangle.size();  
    vec<vec<int>> dp(N + 1, vec<int>(N + 1));  
    for (int i = N - 1; i >= 0; i--) {  
      for (int j = i; j >= 0; j--) {  
        dp[i][j] = std::min(dp[i + 1][j], dp[i + 1][j + 1] + triangle[i][j]);  
      }  
    }  
  
    return dp[0][0];  
  }  
};
```



```c++
class Solution_dfs {  
  int dfs(int row, int col, vec<vec<int>> &triangle, vec<vec<int>> &memo) {  
    if (row >= triangle.size())  
      return 0;  
  
    if (memo[row][col] != 0)  
      return memo[row][col];  
  
    memo[row][col] = std::min(dfs(row + 1, col, triangle, memo),  
                              dfs(row + 1, col + 1, triangle, memo)) +  
                     triangle[row][col];  
  
    return memo[row][col];  
  }  
  
public:  
  int minimumTotal(vec<vec<int>> &triangle) {  
    int N = triangle.size();  
    vec<vec<int>> memo(N, vec<int>(N));  
    return dfs(0, 0, triangle, memo);  
  }  
};
```