---
tags:
  - sum
---
![[pictures/Pasted image 20241014011316.png]]
![[pictures/Pasted image 20241014011328.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int findTargetSumWays(vec<int> &nums, int target) {
    int sum = std::accumulate(nums.begin(), nums.end(), 0);

    int diff = sum - target;
    if (diff < 0 || diff % 2)
      return 0;

    int negative = diff / 2;
    vec<int> dp(negative + 1);
    dp[0] = 1;

    for (int &n : nums)
      for (int j = negative; j >= n; j--)
        dp[j] += dp[j - n];

    return dp[negative];
  }
};
```
