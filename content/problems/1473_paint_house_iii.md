---
tags:
  - paint_house
---
![[pictures/Pasted image 20241013224237.png]]
![[pictures/Pasted image 20241013224255.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<vec<std::optional<long>>>> memo;
  vec<int> houses;
  vec<vec<int>> cost;
  int M, N;

  long dfs(int cur, int pre_color, int target) {
    if (target < 0)
      return INT_MAX;

    if (cur == M && target == 0)
      return 0;

    if (cur == M)
      return INT_MAX;

    if (pre_color >= 0 && memo[cur][pre_color][target])
      return memo[cur][pre_color][target].value();

    long min_cost = INT_MAX;
    if (houses[cur] == 0) {
      for (int cur_color = 1; cur_color <= N; cur_color++) {
        if (cur_color == pre_color)
          min_cost = std::min(min_cost, cost[cur][cur_color - 1] +
                                            dfs(cur + 1, cur_color, target));
        else
          min_cost =
              std::min(min_cost, cost[cur][cur_color - 1] +
                                     dfs(cur + 1, cur_color, target - 1));
      }

    } else {
      if (houses[cur] == pre_color)
        min_cost = std::min(min_cost, dfs(cur + 1, houses[cur], target));
      else
        min_cost = std::min(min_cost, dfs(cur + 1, houses[cur], target - 1));
    }

    memo[cur][pre_color][target] = min_cost;
    return min_cost;
  }

public:
  int minCost(vec<int> _house, vec<vec<int>> _cost, int m, int n, int target) {
    M = m;
    N = n;
    memo = vec<vec<vec<std::optional<long>>>>(
        M + 1, vec<vec<std::optional<long>>>(
                   N + 1, vec<std::optional<long>>(target + 1)));
    houses = std::move(_house);
    cost = std::move(_cost);

    int res = (int)dfs(0, 0, target);
    return res == INT_MAX ? -1 : res;
  }
};
```