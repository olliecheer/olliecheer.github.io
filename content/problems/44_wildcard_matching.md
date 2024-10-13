---
tags:
  - regular_expression
  - dynamic_programming
  - dfs
---
![[pictures/Pasted image 20241012200009.png]]
![[pictures/Pasted image 20241012200019.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool isMatch(std::string &s, std::string &p) {
    int M = s.size(), N = p.size();
    vec<vec<bool>> dp(M + 1, vec<bool>(N + 1));
    dp[0][0] = true;

    for (int i = 1; i <= N; i++) {
      if (p[i - 1] == '*')
        dp[0][i] = dp[0][i - 1];
    }

    for (int i = 1; i <= M; i++) {
      for (int j = 1; j <= N; j++) {
        if (p[j - 1] == s[i - 1] || p[j - 1] == '?')
          dp[i][j] = dp[i - 1][j - 1];
        else if (p[j - 1] == '*')
          dp[i][j] = dp[i - 1][j] || dp[i][j - 1];
      }
    }

    return dp[M][N];
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<std::optional<bool>>> memo;

  bool dfs(std::string &s, std::string &p, int i, int j) {
    if (memo[i][j])
      return memo[i][j].value();

    bool res = false;

    if (s[i - 1] == p[j - 1] || p[j - 1] == '?')
      res = dfs(s, p, i - 1, j - 1);
    else if (p[j - 1] == '*') {
      bool result_text = dfs(s, p, i - 1, j);
      bool result_empty = dfs(s, p, i, j - 1);
      bool result_plain_star = dfs(s, p, i - 1, j - 1);
      res = result_text || result_empty || result_plain_star;
    }

    memo[i][j] = res;
    return res;
  }

public:
  bool isMatch(std::string &s, std::string &p) {
    int M = s.size(), N = p.size();
    memo =
        vec<vec<std::optional<bool>>>(M + 1, vec<std::optional<bool>>(N + 1));
    memo[0][0] = true;
    for (int i = 1; i <= N; i++)
      memo[0][i] = (p[i - 1] == '*' ? memo[0][i - 1] : false);

    for (int i = 1; i <= M; i++)
      memo[i][0] = false;

    dfs(s, p, M, N);

    return memo[M][N].value();
  }
};
```