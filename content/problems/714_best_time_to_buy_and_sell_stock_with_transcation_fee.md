---
tags:
  - sell_stock
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240909232706.png]]

```c++
class Solution {  
public:  
  int maxProfit(vec<int> &prices, int fee) {  
    if (prices.empty())  
      return 0;  
  
    int N = prices.size();  
    vec<vec<int>> dp(N, vec<int>(2));  
    dp[0][0] = 0;  
    dp[0][1] = -prices[0];  
  
    for (int i = 1; i < N; i++) {  
      dp[i][0] = std::max(dp[i - 1][0], dp[i - 1][1] + prices[i] - fee);  
      dp[i][1] = std::max(dp[i - 1][1], dp[i - 1][0] - prices[i]);  
    }  
  
    return dp[N - 1][0];  
  }  
};
```