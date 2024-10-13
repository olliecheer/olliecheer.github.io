---
tags:
  - stone_game
---
![[pictures/Pasted image 20241013223841.png]]
![[pictures/Pasted image 20241013223856.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int mini_max(vec<int> &stones, int cur, vec<std::optional<int>> &memo) {
    if (cur == stones.size())
      return 0;

    if (memo[cur])
      return memo[cur].value();

    int res = INT_MIN;
    int score = 0;

    for (int i = cur; i < cur + 3 && i < stones.size(); i++) {
      score += stones[i];
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