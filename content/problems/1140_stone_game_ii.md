---
tags:
  - stone_game
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240910005048.png]]

```c++
class Solution {  
  int helper(vec<int> &p, int index, int M, vec<vec<int>> &memo,  
             vec<int> &suffix_sum) {  
    if (index == p.size())  
      return 0;  
    if (p.size() - index <= 2 * M)  
      return suffix_sum[index];  
  
    if (memo[index][M])  
      return memo[index][M];  
  
    int min = std::numeric_limits<int>::min();  
    for (int i = 1; i <= 2 * M; i++)  
      min =  
          std::min(min, helper(p, index + 1, std::max(M, i), memo, suffix_sum));  
  
    memo[index][M] = suffix_sum[index] - min;  
  
    return memo[index][M];  
  }  
  
public:  
  int stoneGameII(vec<int> &piles) {  
    int N = piles.size();  
    vec<int> suffix_sum(piles.size());  
    for (int i = N - 1; i >= 0; i--) {  
      if (i == N - 1)  
        suffix_sum[i] = piles[i];  
      else  
        suffix_sum[i] = suffix_sum[i + 1] + piles[i];  
    }  
  
    vec<vec<int>> memo(N, vec<int>(2 * N));  
  
    return helper(piles, 0, 1, memo, suffix_sum);  
  }  
};
```