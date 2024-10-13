---
tags:
  - dynamic_programming
---
![[pictures/Pasted image 20241013224503.png]]
![[pictures/Pasted image 20241013224519.png]]
![[pictures/Pasted image 20241013224535.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<std::optional<int>>> memo;
  int N, M;

  int dfs(vec<int> &cuts, int left, int right) {
    if (memo[left][right])
      return memo[left][right].value();

    if (left >= right)
      return 0;

    int cost =
        (right == M ? N : cuts[right]) - (left == 0 ? 0 : cuts[left - 1]);
    memo[left][right] = INT_MAX;

    for (int i = left; i < right; i++)
      memo[left][right] =
          std::min(memo[left][right].value(),
                   dfs(cuts, left, i) + dfs(cuts, i + 1, right) + cost);

    return memo[left][right].value();
  }

public:
  int minCost(int n, vec<int> &cuts) {
    N = n;
    M = cuts.size();
    std::sort(cuts.begin(), cuts.end());
    memo = vec<vec<std::optional<int>>>(
        cuts.size() + 1, vec<std::optional<int>>(cuts.size() + 1));

    return dfs(cuts, 0, M);
  }
};
```