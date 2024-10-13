---
tags:
  - path
  - sum
  - dfs
  - dynamic_programming
---
![[pictures/Pasted image 20241013222822.png]]
![[pictures/Pasted image 20241013222835.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minFallingPathSum(vec<vec<int>> &arr) {
    int M = arr.size(), N = arr[0].size();
    vec<vec<int>> dp(M, vec<int>(N));
    for (int i = 0; i < N; i++)
      dp[0][i] = arr[0][i];

    for (int i = 1; i < M; i++)
      for (int j = 0; j < N; j++) {
        int prev_row_min = std::numeric_limits<int>::max();
        for (int k = 0; k < N; k++) {
          if (j != k)
            prev_row_min = std::min(prev_row_min, dp[i - 1][k]);
        }
        dp[i][j] = arr[i][j] + prev_row_min;
      }

    int res = std::numeric_limits<int>::max();
    for (int i = 0; i < N; i++)
      res = std::min(res, dp[M - 1][i]);

    return res;
  }
};
```


### Failed

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int M, N;

  int dfs(vec<vec<int>> &arr, int i, int k,
          vec<vec<std::optional<int>>> &memo) {
    if (i == M)
      return 0;

    if (memo[i][k])
      return memo[i][k].value();

    int min_value = INT_MAX;
    for (int j = 0; j < N; j++)
      if (j != k)
        min_value = std::min(min_value, dfs(arr, i + 1, j, memo));

    memo[i][k] = min_value + arr[i][k];
    return memo[i][k].value();
  }

public:
  int minFallingPathSum(vec<vec<int>> &arr) {
    M = arr.size();
    N = arr[0].size();
    vec<vec<std::optional<int>>> memo(M, vec<std::optional<int>>(N));
    int res = INT_MAX;
    for (int j = 0; j < N; j++)
      res = std::min(res, dfs(arr, 0, j, memo));

    return res;
  }
};
```