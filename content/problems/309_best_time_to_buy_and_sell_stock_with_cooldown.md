---
tags:
  - sell_stock
---
![[pictures/Pasted image 20241014003748.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maxProfit(vec<int> &prices) {
    int N = prices.size();
    if (N <= 1)
      return 0;

    vec<vec<int>> dp(N, vec<int>(2));
    dp[0][0] = 0;
    dp[0][1] = -prices[0];
    dp[1][0] = std::max(dp[0][0], dp[0][1] + prices[1]);
    dp[1][1] = std::max(dp[0][1], -prices[1]);

    for (int i = 2; i < N; i++) {
      dp[i][0] = std::max(dp[i - 1][0], dp[i - 1][1] + prices[i]);
      dp[i][1] = std::max(dp[i - 1][1], dp[i - 2][0] - prices[i]);
    }

    return dp[N - 1][0];
  }
};
```