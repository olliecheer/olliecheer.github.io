---
tags:
  - palindrome
  - dfs
---
![[problems/pictures/Pasted image 20240910005917.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int lps(std::string &s, int i, int j, vec<vec<int>> &memo) {
    if (i > j)
      return 0;

    if (i == j)
      return 1;

    if (memo[i][j] > 0)
      return memo[i][j];

    if (s[i] == s[j])
      memo[i][j] = lps(s, i + 1, j - 1, memo) + 2;
    else
      memo[i][j] = std::max(lps(s, i + 1, j, memo), lps(s, i, j - 1, memo));

    return memo[i][j];
  }

public:
  bool isValidPalindrome(std::string &s, int k) {
    int N = s.size();
    vec<vec<int>> memo(N, vec<int>(N));
    return s.size() - lps(s, 0, N - 1, memo) <= k;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int lcs(std::string &s, std::string &r) {
    int N = s.size();
    vec<vec<int>> dp(N + 1, vec<int>(N + 1));
    for (int i = 0; i < N; i++)
      for (int j = 0; j < N; j++)
        if (s[i] == r[j])
          dp[i + 1][j + 1] = dp[i][j] + 1;
        else
          dp[i + 1][j + 1] = std::max(dp[i + 1][j], dp[i][j + 1]);

    return dp[N][N];
  }

public:
  bool isValidPalindrome(std::string &s, int k) {
    std::string r = s;
    std::reverse(r.begin(), r.end());
    return s.size() - lcs(s, r) <= k;
  }
};
```