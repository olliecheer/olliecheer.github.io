---
tags:
  - game
---
![[problems/pictures/Pasted image 20240910003654.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  bool helper(int n, vec<int> &memo) {
    if (n == 1)
      return false;

    if (memo[n] != -1)
      return memo[n];

    bool can_win = false;

    for (int i = 1; i <= n / 2; i++)
      if (n % i == 0 && !helper(n - 1, memo)) {
        can_win = true;
        break;
      }

    memo[n] = can_win;
    return can_win;
  }

public:
  bool divisorGame(int N) {
    vec<int> memo(N + 1, -1);
    return helper(N, memo);
  }
};
```