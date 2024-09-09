---
tags:
  - sum
---
![[problems/pictures/Pasted image 20240909224051.png]]

```c++
class Solution {  
  int subsetSum(vec<int> &nums, int target) {  
    vec<int> dp(target + 1);  
    dp[0] = 1;  
    for (int num : nums) {  
      for (int j = target; j >= 0; j--) {  
        if (j - num >= 0)  
          dp[j] += dp[j - num];  
      }  
    }  
    return dp[target];  
  }  
  
public:  
  int findTargetSumWays(vec<int> &nums, int target) {  
    int sum = std::accumulate(nums.begin(), nums.end(), 0);  
  
    if (target > sum || (sum + target) % 2 == 1)  
      return 0;  
  
    return subsetSum(nums, (sum + target) / 2);  
  }  
};
```