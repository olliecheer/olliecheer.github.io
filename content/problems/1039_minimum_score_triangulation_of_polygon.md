---
tags:
  - dfs
  - dynamic_programming
---
![[pictures/Pasted image 20241013204636.png]]
![[pictures/Pasted image 20241013204645.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minScoreTriangulation(vec<int> &A) {
    int N = A.size();
    vec<vec<int>> dp(N, vec<int>(N));

    for (int i = N - 1; i >= 0; i--)
      for (int j = i + 2; j < N; j++) {
        dp[i][j] = INT_MAX;
        for (int k = i + 1; k < j; k++)
          dp[i][j] =
              std::min(dp[i][j], dp[i][k] + dp[k][j] + A[i] * A[k] * A[j]);
      }

    return dp[0][N - 1];
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {

  int dfs(vec<int> &A, int start, int end, vec<vec<std::optional<int>>> &memo) {
    if (end - start < 2)
      return 0;

    if (memo[start][end])
      return memo[start][end].value();

    int res = INT_MAX;
    for (int i = start + 1; i < end; i++)
      res = std::min(res, dfs(A, start, i, memo) + dfs(A, i, end, memo) +
                              A[start] * A[i] * A[end]);

    memo[start][end] = res;

    return res;
  }

public:
  int minScoreTriangulation(vec<int> &A) {
    vec<vec<std::optional<int>>> memo(51, vec<std::optional<int>>(51));
    return dfs(A, 0, A.size() - 1, memo);
  }
};
```