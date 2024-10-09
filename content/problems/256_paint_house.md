---
tags:
  - paint_house
---
![[problems/pictures/Pasted image 20240908221850.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minCost(vec<vec<int>> &costs) {
    int N = costs.size();
    for (int i = 1; i < N; i++) {
      costs[i][0] += std::min(costs[i - 1][1], costs[i - 1][2]);
      costs[i][1] += std::min(costs[i - 1][0], costs[i - 1][2]);
      costs[i][2] += std::min(costs[i - 1][0], costs[i - 1][1]);
    }

    return std::min({costs[N - 1][0], costs[N - 1][1], costs[N - 1][2]});
  }
};
```



```c++
// T(n) = O(n)
template <typename T> using vec = std::vector<T>;

class Solution {
  std::string get_key(int n, int color) {
    return std::to_string(n) + " " + std::to_string(color);
  }

  int paintCost(vec<vec<int>> const &costs, int n, int color,
                std::unordered_map<std::string, int> &memo) {
    if (memo.count(get_key(n, color)))
      return memo[get_key(n, color)];

    int totalCost = costs[n][color];
    if (n == costs.size() - 1) {
    } else if (color == 0)
      totalCost += std::min(paintCost(costs, n + 1, 1, memo),
                            paintCost(costs, n + 1, 2, memo));
    else if (color == 1)
      totalCost += std::min(paintCost(costs, n + 1, 0, memo),
                            paintCost(costs, n + 1, 2, memo));
    else if (color == 2)
      totalCost += std::min(paintCost(costs, n + 1, 0, memo),
                            paintCost(costs, n + 1, 1, memo));

    memo[get_key(n, color)] = totalCost;
    return totalCost;
  }

public:
  int minCost(vec<vec<int>> &costs) {
    std::unordered_map<std::string, int> memo;
    return std::min({paintCost(costs, 0, 0, memo), paintCost(costs, 0, 1, memo),
                     paintCost(costs, 0, 2, memo)});
  }
};
```