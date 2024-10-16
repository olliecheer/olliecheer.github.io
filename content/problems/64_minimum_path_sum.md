---
tags:
  - dfs
  - matrix
  - dynamic_programming
---
![[problems/pictures/Pasted image 20241012200900.png]]
![[problems/pictures/Pasted image 20241012200911.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minPathSum(vec<vec<int>> &grid) {
    int M = grid.size(), N = grid[0].size();

    for (int i = 0; i < M; i++) {
      for (int j = 0; j < N; j++) {
        if (i == 0 && j == 0)
          continue;
        if (i == 0)
          grid[i][j] += grid[i][j - 1];
        else if (j == 0)
          grid[i][j] += grid[i - 1][j];
        else
          grid[i][j] += std::min(grid[i - 1][j], grid[i][j - 1]);
      }
    }

    return grid[M - 1][N - 1];
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int dfs(vec<vec<int>> &grid, int i, int j, vec<vec<int>> &memo) {
    if (i == 0 && j == 0)
      return grid[0][0];

    if (i < 0 || j < 0)
      return std::numeric_limits<int>::max();

    if (memo[i][j] > 0)
      return memo[i][j];

    memo[i][j] = grid[i][j] +
                 std::min(dfs(grid, i - 1, j, memo), dfs(grid, i, j - 1, memo));

    return memo[i][j];
  }

public:
  int minPathSum(vec<vec<int>> &grid) {
    int M = grid.size(), N = grid[0].size();
    vec<vec<int>> memo(M, vec<int>(N));
    return dfs(grid, M - 1, N - 1, memo);
  }
};
```