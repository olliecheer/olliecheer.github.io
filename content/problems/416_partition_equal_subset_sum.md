---
tags:
---
![[problems/pictures/Pasted image 20240909221750.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool canPartition(vec<int> &nums) {
    int sum = std::accumulate(nums.begin(), nums.end(), 0);
    if (sum % 2)
      return false;

    int half = sum / 2;
    int N = nums.size();

    vec<vec<bool>> dp(N + 1, vec<bool>(half + 1));
    for (int i = 0; i <= N; i++)
      dp[i][0] = true;

    for (int i = 1; i <= N; i++) {
      for (int j = 1; j <= half; j++) {
        dp[i][j] = dp[i - 1][j];
        if (j - nums[i - 1] >= 0)
          dp[i][j] = dp[i][j] || dp[i - 1][j - nums[i - 1]];
      }
    }

    return dp[N][half];
  }
};
```