---
tags:
  - dynamic_programming
---
![[pictures/Pasted image 20241010084041.png]]
![[pictures/Pasted image 20241010084050.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int MOD = (int)1e9 + 7;

public:
  int subarraysWithMoreZerosThanOnes(vec<int> &nums) {
    int sum = 0;
    int N = nums.size();
    vec<vec<int>> dp(N + 1, vec<int>(2));
    std::unordered_map<int, int> mp;
    mp[0] = 1;

    int res = 0;
    for (int i = 1; i <= N; i++) {
      int num = nums[i - 1];
      sum += (num == 1 ? 1 : -1);
      dp[i][0] = mp[sum];
      if (num == 1)
        dp[i][1] = (dp[i - 1][0] + dp[i - 1][1] + 1) % MOD;
      else
        dp[i][1] = (dp[i - 1][1] - dp[i][0] + MOD) % MOD;

      mp[sum]++;
      res = (res + dp[i][1]) % MOD;
    }
    return res;
  }
};
```