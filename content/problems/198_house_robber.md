---
tags:
  - house_robber
  - dynamic_programming
---
![[pictures/Pasted image 20241013235440.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int rob(vec<int> &nums) {
    vec<vec<int>> dp(nums.size() + 1, vec<int>(2));
    for (int i = 1; i <= nums.size(); i++) {
      dp[i][0] = std::max(dp[i - 1][0], dp[i - 1][1]);
      dp[i][1] = nums[i - 1] + dp[i - 1][0];
    }

    return std::max(dp[nums.size()][0], dp[nums.size()][1]);
  }
};
```