---
tags:
  - paint_house
---
![[problems/pictures/Pasted image 20241014002240.png]]
![[problems/pictures/Pasted image 20241014002249.png]]



```c++
// T(n) = O(n*k^2)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minCostII(vec<vec<int>> &costs) {
    int N = costs.size();
    int K = costs[0].size();

    for (int house = 1; house < N; house++) {
      for (int color = 0; color < K; color++) {
        int min = INT_MAX;
        for (int prev = 0; prev < K; prev++) {
          if (color == prev)
            continue;
          min = std::min(min, costs[house - 1][prev]);
        }

        costs[house][color] += min;
      }
    }

    return *std::min_element(costs[N - 1].begin(), costs[N - 1].end());
  }
};
```


```c++
// T(n) = O(n*k^2)  
template <typename T> using vec = std::vector<T>;

class Solution {
  int N, K;

  std::string get_key(int n, int color) {
    return std::to_string(n) + " " + std::to_string(color);
  }

  int help(vec<vec<int>> &costs, int house_number, int color,
                std::unordered_map<std::string, int> &memo) {
    if (house_number == N - 1)
      return costs[house_number][color];

    if (memo.count(get_key(house_number, color)))
      return memo[get_key(house_number, color)];

    int min_remaining_cost = std::numeric_limits<int>::max();
    for (int next_color = 0; next_color < K; next_color++) {
      if (color == next_color)
        continue;
      min_remaining_cost =
          std::min(min_remaining_cost,
                   help(costs, house_number + 1, next_color, memo));
    }

    int res = costs[house_number][color] + min_remaining_cost;
    memo[get_key(house_number, color)] = res;
    return res;
  }

public:
  int minCostII(vec<vec<int>> &costs) {
    N = costs.size();
    K = costs[0].size();
    std::unordered_map<std::string, int> memo;
    int res = INT_MAX;
    for (int color = 0; color < K; color++)
      res = std::min(res, help(costs, 0, color, memo));

    return res;
  }
};
```


```c++
// T(n) = O(n*k)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minCostII(vec<vec<int>> &costs) {
    int N = costs.size();
    int K = costs[0].size();

    int prev_min = 0, prev_sec_min = 0, prev_min_index = -1;
    for (int i = 0; i < N; i++) {
      int cur_min = INT_MAX;
      int cur_sec_min = INT_MAX;
      int cur_min_index = 0;

      for (int j = 0; j < K; j++) {
        if (prev_min_index == j)
          costs[i][j] += prev_sec_min;
        else
          costs[i][j] += prev_min;

        if (costs[i][j] < cur_min) {
          cur_sec_min = cur_min;
          cur_min = costs[i][j];
          cur_min_index = j;
        } else if (costs[i][j] < cur_sec_min)
          cur_sec_min = costs[i][j];
      }

      prev_min = cur_min;
      prev_sec_min = cur_sec_min;
      prev_min_index = cur_min_index;
    }

    return prev_min;
  }
};
```