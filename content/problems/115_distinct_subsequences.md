---
tags:
  - subsequence
  - dfs
  - recursion
  - iteration
---
![[problems/pictures/Pasted image 20240908025529.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int numDistinct(std::string &s, std::string &t) {
    int M = s.size(), N = t.size();
    vec<vec<int>> dp(M + 1, vec<int>(N + 1));
    for (int i = 0; i < M + 1; i++)
      dp[i][0] = 1;

    for (int i = 1; i < M + 1; i++) {
      for (int j = 1; j < N + 1; j++) {

        if (s[i - 1] == t[j - 1])
          dp[i][j] = (dp[i - 1][j] + dp[i - 1][j - 1]) % 1000000007;
        else
          dp[i][j] = dp[i - 1][j] % 1000000007;
      }
    }

    return dp[M][N];
  }
};
```


## DFS
```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int dfs(std::string &s, std::string &t, int i, int j, vec<vec<int>> &memo) {
    if (j >= t.size())
      return 1;
    if (i >= s.size())
      return 0;

    if (memo[i][j] != -1)
      return memo[i][j];

    int subsequence = dfs(s, t, i + 1, j, memo);
    if (s[i] == t[j])
      subsequence += dfs(s, t, i + 1, j + 1, memo);

    memo[i][j] = subsequence;
    return subsequence;
  }

public:
  int numDistinct(std::string &s, std::string &t) {
    vec<vec<int>> memo(s.size(), vec<int>(t.size(), -1));
    return dfs(s, t, 0, 0, memo);
  }
};
```