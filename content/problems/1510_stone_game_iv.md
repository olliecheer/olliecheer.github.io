---
tags:
  - stone_game
  - dynamic_programming
---

![[problems/pictures/Pasted image 20240910014347.png]]


```c++
class Solution {  
  
  bool helper(int n, vec<int> &memo) {  
    if (memo[n] != -1)  
      return memo[n];  
  
    for (int i = std::sqrt(n); i > 0; i--) {  
      if (!helper(n - (i * i), memo)) {  
        memo[n] = true;  
        return true;  
      }  
    }  
    memo[n] = false;  
    return false;  
  }  
  
public:  
  bool winnerSquareGame(int n) {  
    vec<int> memo(n + 1, -1);  
    return helper(n, memo);  
  }  
};
```