---
tags:
  - sell_stock
---
![[problems/pictures/Pasted image 20240909211615.png]]

```c++
class Solution {  
public:  
  int maxProfit(vec<int> &prices) {  
    if (prices.empty())  
      return 0;  
  
    int N = prices.size();  
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