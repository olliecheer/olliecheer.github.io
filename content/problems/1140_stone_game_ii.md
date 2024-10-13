---
tags:
  - stone_game
  - dynamic_programming
---
![[pictures/Pasted image 20241013213439.png]]
![[pictures/Pasted image 20241013213448.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int stoneGameII(vec<int> &piles) {
    int n = piles.size();
    vec<vec<int>> dp(n + 1, vec<int>(n + 1, INT_MIN));
    for (int i = n; i >= 0; i--)
      for (int m = 1; m <= n; m++) {
        if (i == n)
          dp[i][m] = 0;
        else {
          int sum = 0;
          for (int x = 1; x <= 2 * m; x++) {
            if (i + x > n)
              break;

            sum += piles[i + x - 1];
            dp[i][m] = max(dp[i][m], sum - dp[i + x][min(n, max(m, x))]);
          }
        }
      }

    return (dp[0][1] + accumulate(piles.begin(), piles.end(), 0)) / 2;
  }
};

```