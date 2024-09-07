---
tags:
  - permutation
  - backtrack
  - dfs
---
![[problems/pictures/Pasted image 20240907232239.png]]

```c++
class Solution {  
  void backtrack(vec<vec<int>> &res, vec<int> &level, vec<int> &nums,  
                 vec<bool> &used) {  
    if (level.size() == nums.size())  
      res.push_back(level);  
    else {  
      for (int i = 0; i < nums.size(); i++) {  
        if (used[i] || i > 0 && nums[i] == nums[i - 1] && !used[i - 1])  
          continue;  
  
        used[i] = true;  
        level.push_back(nums[i]);  
        backtrack(res, level, nums, used);  
        used[i] = false;  
        level.pop_back();  
      }  
    }  
  }  
  
public:  
  vec<vec<int>> permuteUnique(vec<int> &nums) {  
    vec<vec<int>> res;  
    std::sort(nums.begin(), nums.end());  
    vec<int> level;  
    vec<bool> visited(nums.size());  
    backtrack(res, level, nums, visited);  
    return res;  
  }  
};
```
