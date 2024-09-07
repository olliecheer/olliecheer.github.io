---
tags:
  - sell_stock
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240908030510.png]]

```c++
class Solution {  
public:  
  int maxProfit(vec<int> &prices) {  
    if (prices.empty())  
      return 0;  
  
    int N = prices.size();  
    vec<vec<vec<int>>> dp(N, vec<vec<int>>(3, vec<int>(2)));  
    dp[0][1][0] = 0;  
    dp[0][1][1] = -prices[0];  
    dp[0][2][0] = 0;  
    dp[0][2][1] = -prices[0];  
  
    for (int i = 1; i < N; i++) {  
      for (int j = 2; j >= 1; j--) {  
        dp[i][j][0] = std::max(dp[i - 1][j][0], dp[i - 1][j][1] + prices[i]);  
        dp[i][j][1] =  
            std::max(dp[i - 1][j][1], dp[i - 1][j - 1][0] - prices[i]);  
      }  
    }  
  
    return dp[N - 1][2][0];  
  }  
};
```

