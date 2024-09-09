---
tags:
  - mod
  - subarray
---

![[problems/pictures/Pasted image 20240910022937.png]]


```c++
class Solution {  
  int MOD = (int)1e9 + 7;  
  
public:  
  int subarraysWithMoreZerosThanOnes(vec<int> &nums) {  
    int sum = 0;  
    int N = nums.size();  
    vec<vec<int>> dp(N + 1, vec<int>(2));  
    std::unordered_map<int, int> mp;  
    mp.insert({0, 1});  
  
    int res = 0;  
    for (int i = 1; i <= N; i++) {  
      int num = nums[i - 1];  
      sum += (num == 1 ? 1 : -1);  
      dp[i][0] = mp[sum];  
      if (num == 1) {  
        dp[i][1] = (dp[i - 1][0] + dp[i - 1][1] + 1) % MOD;  
      } else {  
        dp[i][1] = (dp[i - 1][1] - dp[i][0] + MOD) % MOD;  
      }  
      mp.insert({sum, mp[sum] + 1});  
      res = (res + dp[i][1]) % MOD;  
    }  
    return res;  
  }  
};
```