---
tags:
  - game
  - stone_game
  - dynamic_programming
  - dfs
---
![[problems/pictures/Pasted image 20240910001934.png]]

```c++
class Solution {  
  int dfs(vec<int> &piles, int i, int j, vec<vec<int>> &memo) {  
    if (i > j)  
      return 0;  
  
    if (memo[i][j] != -1)  
      return memo[i][j];  
  
    memo[i][j] = std::max(piles[i] - dfs(piles, i + 1, j, memo),  
                          piles[j] - dfs(piles, i, j - 1, memo));  
  
    return memo[j][j];  
  }  
  
public:  
  bool stoneGame(vec<int> &piles) {  
    vec<vec<int>> memo(piles.size(), vec<int>(piles.size(), -1));  
  
    dfs(piles, 0, piles.size() - 1, memo);  
    return memo[0][piles.size() - 1] > 0;  
  }  
};
```