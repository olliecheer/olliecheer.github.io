---
tags:
  - sum
---
![[problems/pictures/Pasted image 20241014011316.png]]
![[problems/pictures/Pasted image 20241014011328.png]]



```c++
class Solution {
public:
  int findTargetSumWays(std::vector<int> &nums, int target) {
    int sum = 0;
    for (int &num : nums)
      sum += num;

    int diff = sum - target;
    if (diff < 0 || diff % 2 != 0)
      return 0;

    int n = nums.size(), neg = diff / 2;
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(neg + 1));
    dp[0][0] = 1;
    for (int i = 1; i <= n; i++) {
      int num = nums[i - 1];
      for (int j = 0; j <= neg; j++) {
        dp[i][j] = dp[i - 1][j];
        if (j >= num)
          dp[i][j] += dp[i - 1][j - num];
      }
    }
    return dp[n][neg];
  }
};
```
