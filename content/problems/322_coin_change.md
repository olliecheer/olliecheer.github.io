---
tags:
  - coin_change
  - dynamic_programming
---
![[problems/pictures/Pasted image 20241014004310.png]]
![[problems/pictures/Pasted image 20241014004320.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int coinChange(vec<int> const &coins, int amount) {
    int N = coins.size();
    vec<vec<int>> dp(N + 1, vec<int>(amount + 1, INT_MAX));

    for (int i = 0; i <= N; i++)
      dp[i][0] = 0;

    for (int i = 1; i <= N; i++) {
      for (int j = 0; j <= amount; j++) {
        dp[i][j] = dp[i - 1][j];
        if (j >= coins[i - 1] && dp[i][j - coins[i - 1]] != INT_MAX)
          dp[i][j] = std::min(dp[i][j], dp[i][j - coins[i - 1]] + 1);
      }
    }

    return dp[N][amount] == INT_MAX ? -1 : dp[N][amount];
  }
};
```