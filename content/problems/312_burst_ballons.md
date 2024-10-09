---
tags:
  - dfs
---
![[problems/pictures/Pasted image 20240909211833.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maxCoins(vec<int> &nums) {
    vec<int> ballons(nums.size() + 2);
    int N = ballons.size();
    ballons[0] = ballons[N - 1] = 1;

    for (int i = 1; i < N - 1; i++)
      ballons[i] = nums[i - 1];

    vec<vec<int>> dp(N, vec<int>(N));

    for (int i = N - 2; i >= 0; i--)
      for (int j = i + 2; j < N; j++)
        for (int k = i + 1; k < j; k++)
          dp[i][j] = std::max(dp[i][j], ballons[i] * ballons[k] * ballons[j] +
                                            dp[i][k] + dp[k][j]);

    return dp[0][N - 1];
  }
};
```


## DFS

memory limit exceeded

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int get(vec<int> nums, int i) {
    if (i == -1 || i == nums.size())
      return 1;
    else
      return nums[i];
  }

  int dfs(vec<int> &nums, int start, int end,
          vec<vec<std::optional<int>>> &memo) {
    if (start > end)
      return 0;

    if (memo[start][end])
      return memo[start][end].value();

    int max = INT_MIN;
    for (int i = start; i <= end; i++) {
      int left = dfs(nums, start, i - 1, memo);
      int right = dfs(nums, i + 1, end, memo);
      int cur = get(nums, i) * get(nums, start - 1) * get(nums, end + 1);
      max = std::max(max, left + right + cur);
    }

    memo[start][end] = max;
    return max;
  }

public:
  int maxCoins(vec<int> &nums) {
    int N = nums.size();
    vec<vec<std::optional<int>>> memo(N, vec<std::optional<int>>(N));
    return dfs(nums, 0, N - 1, memo);
  }
};
```