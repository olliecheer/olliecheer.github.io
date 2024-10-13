---
tags:
  - sell_stock
---
![[pictures/Pasted image 20241013235343.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maxProfit(int K, vec<int> prices) {
    if (prices.empty())
      return 0;

    int N = prices.size();

    if (2 * K > N) {
      int res = 0;
      for (int i = 1; i < N; i++)
        res += std::max(0, prices[i] - prices[i - 1]);
      return res;
    } else {
      vec<vec<vec<int>>> dp(N, vec<vec<int>>(K + 1, vec<int>(2)));
      for (int i = 0; i < N; i++) {
        for (int j = K; j >= 1; j--) {
          if (i == 0) {
            dp[0][j][0] = 0;
            dp[0][j][1] = -prices[0];
            continue;
          }

          dp[i][j][0] = std::max(dp[i - 1][j][0], dp[i - 1][j][1] + prices[i]);
          dp[i][j][1] =
              std::max(dp[i - 1][j][1], dp[i - 1][j - 1][0] - prices[i]);
        }
      }

      return dp[N - 1][K][0];
    }
  }
};
```

