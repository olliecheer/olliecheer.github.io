---
tags:
  - coin_change
  - dynamic_programming
---

![[problems/pictures/Pasted image 20240909213221.png]]

```c++
class Solution {  
public:  
  int coinChange(vec<int> const &coins, int amount) {  
    vec<vec<int>> dp(coins.size() + 1,  
                     vec<int>(amount + 1, std::numeric_limits<int>::max()));  
  
    for (int i = 0; i <= coins.size(); i++)  
      dp[i][0] = 0;  
  
    for (int i = 1; i <= coins.size(); i++) {  
      for (int j = 0; j <= amount; j++) {  
        dp[i][j] = dp[i - 1][j];  
        if (j >= coins[i - 1] &&  
            dp[i][j - coins[i - 1]] != std::numeric_limits<int>::max())  
          dp[i][j] = std::min(dp[i][j], dp[i][j - coins[i - 1]] + 1);  
      }  
    }  
  
    return dp[coins.size()][amount] == std::numeric_limits<int>::max()  
               ? -1  
               : dp[coins.size()][amount];  
  }  
};
```