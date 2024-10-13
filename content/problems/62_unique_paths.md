---
tags:
  - matrix
  - dynamic_programming
---
![[pictures/Pasted image 20241012200833.png]]
![[pictures/Pasted image 20241012200843.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int uniquePaths(int m, int n) {
    vec<vec<int>> dp(m, vec<int>(n));
    for (int i = 0; i < m; i++)
      dp[i][0] = 1;

    for (int j = 0; j < n; j++)
      dp[0][j] = 1;

    for (int i = 1; i < m; i++)
      for (int j = 1; j < n; j++)
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1];

    return dp[m - 1][n - 1];
  }
};
```