---
tags:
  - coin_change
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240909224620.png]]


### DP Array

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int change(int amount, vec<int> &coins) {
    auto dp = vec<vec<int>>(coins.size() + 1, vec<int>(amount + 1));

    for (int i = 0; i <= coins.size(); i++)
      dp[i][0] = 1;

    for (int i = 1; i <= coins.size(); i++) {
      for (int j = 1; j <= amount; j++) {
        dp[i][j] = dp[i - 1][j];
        if (j - coins[i - 1] >= 0)
          dp[i][j] = dp[i][j - coins[i - 1]];
      }
    }

    return dp[coins.size()][amount];
  }
};
```
