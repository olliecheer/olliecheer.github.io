---
tags:
  - palindrome
---
![[problems/pictures/Pasted image 20240910011740.png]]

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
  int minInsertions(std::string &s) {
    std::string r = s;
    std::reverse(r.begin(), r.end());
    return s.size() - lcs(s, r);
  }
};
```