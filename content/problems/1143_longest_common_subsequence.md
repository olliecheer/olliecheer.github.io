---
tags:
  - subsequence
  - dynamic_programming
  - dfs
---
![[problems/pictures/Pasted image 20240910005124.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int longestCommonSubsequence(std::string &s1, std::string &s2) {
    int N1 = s1.size(), N2 = s2.size();
    vec<vec<int>> dp(N1 + 1, vec<int>(N2 + 1));
    for (int i = 1; i <= N1; i++)
      for (int j = 1; j <= N2; j++)
        if (s1[i - 1] == s2[j - 1])
          dp[i][j] = dp[i - 1][j - 1] + 1;
        else
          dp[i][j] = std::max(dp[i][j - 1], dp[i - 1][j]);

    return dp[N1][N2];
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int dfs(std::string &s1, std::string &s2, int p1, int p2,
          vec<vec<int>> &memo) {
    if (p1 >= s1.size() || p2 >= s2.size())
      return 0;

    if (memo[p1][p2] != -1)
      return memo[p1][p2];

    if (s1[p1] == s2[p2])
      memo[p1][p2] = 1 + dfs(s1, s2, p1 + 1, p2 + 1, memo);
    else
      memo[p1][p2] = std::max(dfs(s1, s2, p1 + 1, p2, memo),
                              dfs(s1, s2, p1, p2 + 1, memo));
    return memo[p1][p2];
  }

public:
  int longestCommonSubsequence(std::string &s1, std::string &s2) {
    int N1 = s1.size(), N2 = s2.size();
    vec<vec<int>> memo(N1, vec<int>(N2, -1));
    return dfs(s1, s2, 0, 0, memo);
  }
};
```