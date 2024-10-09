---
tags:
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240907234133.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int climbStairs(int n) {
    if (n < 2)
      return n;

    vec<int> dp(n + 1);
    dp[1] = 1;
    dp[2] = 2;

    for (int i = 3; i <= n; i++)
      dp[i] = dp[i - 1] + dp[i - 2];

    return dp[n];
  }
};
```