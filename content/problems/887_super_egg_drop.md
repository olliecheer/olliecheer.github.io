---
tags:
  - egg_drop
  - dynamic_programming
---

![[problems/pictures/Pasted image 20240910002025.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int helper(int K, int N, vec<vec<int>> &memo) {
    if (N <= 1)
      return N;
    if (K == 1)
      return N;

    if (memo[K][N] > 0)
      return memo[K][N];

    int low = 1, high = N, res = N;

    while (low <= high) {
      int mid = low + (high - low) / 2;
      int left = helper(K - 1, mid - 1, memo);
      int right = helper(K, N - mid, memo);
      res = std::min(res, std::max(left, right) + 1);

      if (left < right)
        low = mid + 1;
      else if (left > right)
        high = mid - 1;
      else
        break;
    }

    memo[K][N] = res;
    return res;
  }

public:
  int superEggDrop(int K, int N) {
    vec<vec<int>> memo(K + 1, vec<int>(N + 1));
    return helper(K, N, memo);
  }
};
```