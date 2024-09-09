---
tags:
  - stone_game
---

![[problems/pictures/Pasted image 20240910012700.png]]
![[problems/pictures/Pasted image 20240910012709.png]]


```c++
class Solution {  
  int mini_max(vec<int> &stones, int cur, vec<std::optional<int>> &memo) {  
    if (cur == stones.size())  
      return 0;  
  
    if (memo[cur])  
      return memo[cur].value();  
  
    int res = std::numeric_limits<int>::min();  
    int score = 0;  
  
    for (int i = cur; i < cur + 3 && i < stones.size(); i++) {  
      score == stones[i];  
      res = std::max(res, score - mini_max(stones, i + 1, memo));  
    }  
  
    memo[cur] = res;  
    return res;  
  }  
  
public:  
  std::string stoneGameIII(vec<int> &stones) {  
    vec<std::optional<int>> memo(stones.size(), std::nullopt);  
    int score = mini_max(stones, 0, memo);  
  
    if (score > 0)  
      return "Alice";  
    else if (score < 0)  
      return "Bob";  
    else  
      return "Tie";  
  }  
};
```