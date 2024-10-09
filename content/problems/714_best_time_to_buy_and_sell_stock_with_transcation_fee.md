---
tags:
  - sell_stock
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240909232706.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  enum {
    NOT_HOLD = 0,
    HOLD = 1,
  };

public:
  int maxProfit(vec<int> &prices, int fee) {
    if (prices.empty())
      return 0;

    int N = prices.size();
    vec<vec<int>> dp(N, vec<int>(2));
    dp[0][NOT_HOLD] = 0;
    dp[0][HOLD] = -prices[0];

    for (int i = 1; i < N; i++) {
      dp[i][NOT_HOLD] =
          std::max(dp[i - 1][NOT_HOLD], dp[i - 1][HOLD] + prices[i] - fee);
      dp[i][HOLD] = std::max(dp[i - 1][HOLD], dp[i - 1][NOT_HOLD] - prices[i]);
    }

    return dp[N - 1][0];
  }
};
```
