---
tags:
  - game
  - dfs
  - dynamic_programming
  - state_compression
---
![[problems/pictures/Pasted image 20240909223329.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  std::unordered_map<int, bool> memo;

  bool dfs(int maxChoosableInteger, int usedNumber, int desiredTotal,
           int currentTotal) {
    if (!memo.count(usedNumber)) {
      bool res = false;
      for (int i = 0; i < maxChoosableInteger; i++) {
        if (((usedNumber >> i) & 1) == 0) {
          if (i + 1 + currentTotal >= desiredTotal) {
            res = true;
            break;
          }

          if (!dfs(maxChoosableInteger, usedNumber | (1 << i), desiredTotal,
                   currentTotal + i + 1)) {
            res = true;
            break;
          }
        }
      }

      memo[usedNumber] = res;
    }

    return memo[usedNumber];
  }

public:
  bool canIWin(int maxChoosableInteger, int desiredTotal) {
    if ((1 + maxChoosableInteger) * maxChoosableInteger / 2 < desiredTotal)
      return false;

    return dfs(maxChoosableInteger, 0, desiredTotal, 0);
  }
};
```
