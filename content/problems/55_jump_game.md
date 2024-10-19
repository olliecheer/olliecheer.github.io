---
tags:
  - jump_game
  - dynamic_programming
  - greedy
---
![[problems/pictures/Pasted image 20241012200553.png]]



```c++
// O(n)  
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<std::optional<bool>> memo;

  bool canJumpFromPosition(int pos, vec<int> &nums) {
    if (memo[pos])
      return memo[pos].value();

    int furthest = std::min(pos + nums[pos], (int)nums.size() - 1);
    for (int next = pos + 1; next <= furthest; next++)
      if (canJumpFromPosition(next, nums) == 1) {
        memo[pos] = true;
        return true;
      }

    memo[pos] = false;
    return false;
  }

public:
  bool canJump(vec<int> &nums) {
    memo = vec<std::optional<bool>>(nums.size());
    memo.back() = 1;
    return canJumpFromPosition(0, nums);
  }
};
```

## Greedy

```c++
// O(n)  
template <typename T> using vec = std::vector<T>;

class Solution {  
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