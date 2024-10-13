---
tags:
  - game
  - dynamic_programming
---
![[pictures/Pasted image 20241014011125.png]]
![[pictures/Pasted image 20241014011139.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int dfs(vec<int> &piles, int i, int j, vec<vec<int>> &memo) {
    if (i > j)
      return 0;

    if (memo[i][j] != -1)
      return memo[i][j];

    memo[i][j] = std::max(piles[i] - dfs(piles, i + 1, j, memo),
                          piles[j] - dfs(piles, i, j - 1, memo));
    return memo[i][j];
  }

public:
  bool predictTheWinner(vec<int> piles) {
    vec<vec<int>> memo(piles.size(), vec<int>(piles.size(), -1));
    return dfs(piles, 0, piles.size() - 1, memo) >= 0;
  }
};
```
