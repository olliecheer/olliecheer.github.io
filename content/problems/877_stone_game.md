---
tags:
  - game
  - stone_game
  - dynamic_programming
  - dfs
---
![[problems/pictures/Pasted image 20240910001934.png]]

```c++
template <typename T> using vec = std::vector<T>;

template <typename T> using opt = std::optional<T>;

class Solution {
  int dfs(vec<int> &piles, int i, int j, vec<vec<opt<int>>> &memo) {
    if (i > j)
      return 0;

    if (memo[i][j])
      return memo[i][j].value();

    memo[i][j] = std::max(piles[i] - dfs(piles, i + 1, j, memo),
                          piles[j] - dfs(piles, i, j - 1, memo));

    return memo[i][j].value();
  }

public:
  bool stoneGame(vec<int> piles) {
    vec<vec<opt<int>>> memo(piles.size(), vec<opt<int>>(piles.size()));
    dfs(piles, 0, piles.size() - 1, memo);
    return memo[0][piles.size() - 1] > 0;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

template <typename T> using opt = std::optional<T>;

class Solution {
public:
  bool stoneGame(vec<int> piles) {
    int N = piles.size();
    vec<vec<int>> dp(N, vec<int>(N));
    for (int i = N - 1; i >= 0; i--) {
      dp[i][i] = piles[i];
      for (int j = i + 1; j < N; j++)
        dp[i][j] = std::max(piles[i] - dp[i + 1][j], piles[j] - dp[i][j - 1]);
    }

    return dp[0][N - 1] >= 0;
  }
};
```