---
tags:
  - backpack
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240910001533.png]]


Not leetcode

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool canPartition(int n, vec<int> &prices, vec<int> &weight,
                    vec<int> &amount) {
    auto dp = vec<vec<int>>(prices.size() + 1, vec<int>(n + 1));
    for (int i = 1; i < prices.size(); i++)
      for (int j = 1; j <= n; j++) {
        dp[i][j] = dp[i - 1][j];
        for (int k = 0; k <= amount[i - 1]; k++)
          if (j - k * prices[i - 1] >= 0)
            dp[i][j] = std::max(dp[i][j], dp[i - 1][j - k * prices[i - 1]] +
                                              k * weight[i - 1]);
      }

    return dp[prices.size()][n];
  }
};
```