---
tags:
  - pascals_triangle
  - combination
---
![[pictures/Pasted image 20241013232939.png]]
![[pictures/Pasted image 20241013232950.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<std::optional<int>>> memo;

  int nCk(int n, int k) {
    if (k == 0 || n == k)
      return 1;
    if (memo[n][k])
      return memo[n][k].value();

    int res = nCk(n - 1, k - 1) + nCk(n - 1, k);
    memo[n][k] = res;

    return res;
  }

public:
  vec<int> getRow(int n) {
    vec<int> row;
    memo = vec<vec<std::optional<int>>>((size_t)n + 1,
                                        vec<std::optional<int>>(n + 1));
    for (int k = 0; k <= n; k++)
      row.push_back(nCk(n, k));

    return row;
  }
};
```