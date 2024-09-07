---
tags:
  - jump_game
  - dynamic_programming
  - greedy
---
![[problems/pictures/Pasted image 20240907224444.png]]


```c++
class Solution_dp {  
public:  
  int jump(vec<int> &nums) {  
    vec<int> dp(nums.size(), std::numeric_limits<int>::max());  
    dp[0] = 0;  
  
    for (int i = 1; i < nums.size(); i++) {  
      for (int j = 0; j < i; j++) {  
        if (nums[j] + j >= i) {  
          dp[i] = std::min(dp[i], dp[j] + 1);  
        }  
      }  
    }  
    return dp.back();  
  }  
};
```


```c++
class Solution_greedy {  
public:  
  int jump(vec<int> &nums) {  
    int jumps = 0, cur_end = 0, cur_farthest = 0;  
    for (int i = 0; i < nums.size() - 1; i++) {  
      cur_farthest = std::max(cur_farthest, i + nums[i]);  
      if (i == cur_end) {  
        jumps++;  
        cur_end = cur_farthest;  
      }  
    }  
  
    return jumps;  
  }  
};
```