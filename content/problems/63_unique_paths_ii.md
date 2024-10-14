---
tags:
  - matrix
  - path
  - dfs
---
![[problems/pictures/Pasted image 20241012200733.png]]
![[problems/pictures/Pasted image 20241012200746.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int dfs(vec<vec<int>> &grid, int i, int j, vec<vec<int>> &memo) {
    if (i == 0 && j == 0)
      return grid[i][j] == 1 ? 0 : 1;

    if (i < 0 || j < 0 || grid[i][j] == 1)
      return 0;

    if (memo[i][j] > 0)
      return memo[i][j];

    memo[i][j] = dfs(grid, i - 1, j, memo) + dfs(grid, i, j - 1, memo);

    return memo[i][j];
  }

public:
  int uniquePathsWithObstacles(vec<vec<int>> &obstacleGrid) {
    int M = obstacleGrid.size(), N = obstacleGrid[0].size();
    auto memo = vec<vec<int>>(M, vec<int>(N));
    return dfs(obstacleGrid, M - 1, N - 1, memo);
  }
};
```


## Iterative

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int uniquePathsWithObstacles(vec<vec<int>> &obstacleGrid) {
    int M = obstacleGrid.size(), N = obstacleGrid[0].size();
    auto dp = vec<vec<int>>(M, vec<int>(N));

    for (int i = 0; i < M; i++) {
      if (obstacleGrid[i][0] == 1)
        break;

      dp[i][0] = 1;
    }

    for (int i = 0; i < N; i++) {
      if (obstacleGrid[0][i] == 1)
        break;

      dp[0][i] = 1;
    }

    for (int i = 1; i < M; i++)
      for (int j = 1; j < N; j++)
        dp[i][j] = obstacleGrid[i][j] != 1 ? dp[i - 1][j] + dp[i][j - 1] : 0;

    return dp[M - 1][N - 1];
  }
};
```