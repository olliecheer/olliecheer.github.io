---
tags:
  - palindrome
  - subsequence
---
![[problems/pictures/Pasted image 20241010210829.png]]

### Based on Longest Common Subsequence

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int lcs(std::string &s, std::string &r) {
    int N = s.size();
    vec<vec<int>> dp(N + 1, vec<int>(N + 1));

    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        if (s[i] == r[j])
          dp[i + 1][j + 1] = dp[i][j] + 1;
        else
          dp[i + 1][j + 1] = std::max(dp[i + 1][j], dp[i][j + 1]);
      }
    }

    return dp[N][N];
  }

public:
  int longestPalindromeSubseq(std::string &s) {
    std::string r = s;
    std::reverse(r.begin(), r.end());
    return lcs(s, r);
  }
};
```


### Iterative

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int longestPalindromeSubseq(std::string &s) {
    int N = s.size();
    vec<vec<int>> dp(N, vec<int>(N));
    for (int i = N - 1; i >= 0; i--) {
      dp[i][i] = 1;
      for (int j = i + 1; j < N; j++) {
        if (s[i] == s[j])
          dp[i][j] = dp[i + 1][j - 1] + 2;
        else
          dp[i][j] = std::max(dp[i + 1][j], dp[i][j - 1]);
      }
    }
    return dp[0][N - 1];
  }
};
```


### DFS

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int dfs(std::string &s, int i, int j, vec<vec<std::optional<int>>> &memo) {
    if (i > j)
      return 0;

    if (i == j)
      return 1;

    if (memo[i][j])
      return memo[i][j].value();

    if (s[i] == s[j])
      memo[i][j] = dfs(s, i + 1, j - 1, memo) + 2;
    else
      memo[i][j] = std::max(dfs(s, i + 1, j, memo), dfs(s, i, j - 1, memo));

    return memo[i][j].value();
  }

public:
  int longestPalindromeSubseq(std::string &s) {
    int N = s.size();
    vec<vec<std::optional<int>>> memo(N, vec<std::optional<int>>(N));
    return dfs(s, 0, N - 1, memo);
  }
};
```
