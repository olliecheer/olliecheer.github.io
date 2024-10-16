---
tags:
  - dynamic_programming
  - memo
  - fibonacci
---

![[problems/pictures/Pasted image 20241010210711.png]]
![[problems/pictures/Pasted image 20241010210724.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int helper(int n, vec<int> &memo) {
    if (n < 2)
      return n;

    if (memo[n] > 0)
      return memo[n];

    memo[n] = helper(n - 1, memo) + helper(n - 2, memo);
    return memo[n];
  }

public:
  int fib(int N) {
    vec<int> memo(N + 1);
    return helper(N, memo);
  }
};
```
