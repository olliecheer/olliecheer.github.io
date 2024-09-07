---
tags:
  - jump_game
  - dynamic_programming
  - greedy
---
![[problems/pictures/Pasted image 20240907233345.png]]


```c++
// O(n^2)  
class Solution_dp {  
  vec<std::optional<int>> &memo;  
  
  int canJumpFromPosition(int pos, vec<int> &nums) {  
    if (memo[pos])  
      return memo[pos].value();  
  
    int furthest = std::min(pos + nums[pos], (int)nums.size() - 1);  
    for (int next = pos + 1; next <= furthest; next++) {  
      if (canJumpFromPosition(next, nums) == 1) {  
        memo[pos] = 1;  
        return 1;  
      }  
    }  
  
    memo[pos] = -1;  
    return -1;  
  }  
  
public:  
  bool canJump(vec<int> &nums) {  
    memo = vec<std::optional<int>>(nums.size());  
    memo.back() = 1;  
    return canJumpFromPosition(0, nums) == 1;  
  }  
};
```


```c++
// O(n)  
class Solution_greedy {  
public:  
  bool canJump(vec<int> &nums) {  
    int furthest = 0;  
  
    for (int i = 0; i < nums.size() - 1; i++) {  
      if (i <= furthest)  
        furthest = std::max(furthest, i + nums[i]);  
    }  
  
    return furthest >= nums.size() - 1;  
  }  
};
```