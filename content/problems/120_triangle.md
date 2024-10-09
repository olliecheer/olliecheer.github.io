---
tags:
  - iteration
  - recursion
  - dynamic_programming
---


![[problems/pictures/Pasted image 20240908025919.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minimumTotal(vec<vec<int>> &triangle) {
    int N = triangle.size();
    vec<int> dp(triangle.back());

    for (int i = N - 2; i >= 0; i--)
      for (int j = 0; j <= i; j++)
        dp[j] = std::min(dp[j], dp[j + 1]) + triangle[i][j];

    return dp[0];
  }
};
```


Time Limit Exceeded

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
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