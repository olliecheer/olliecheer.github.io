---
tags:
  - dynamic_programming
  - game
---
![[problems/pictures/Pasted image 20240910004217.png]]


```c++
class Solution {  
public:  
  int lastStoneWeightII(vec<int> &stones) {  
    int sum = std::accumulate(stones.begin(), stones.end(), 0);  
    int target = sum / 2;  
    vec<vec<int>> dp(stones.size() + 1, vec<int>(stones.size() + 1));  
    for (int i = 1; i <= stones.size(); i++) {  
      for (int j = 1; j <= target; j++) {  
        dp[i][j] = dp[i - 1][j];  
        if (j - stones[i - 1] >= 0)  
          dp[i][j] = std::max(stones[i - 1] + dp[i - 1][j - stones[i - 1]],  
                              dp[i - 1][j]);  
      }  
    }  
  
    return sum - 2 * dp[stones.size()][target];  
  }  
};
```