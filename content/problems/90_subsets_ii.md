---
tags:
  - subset
  - array
  - combination
  - dfs
---
![[problems/pictures/Pasted image 20240908023016.png]]

```c++
class Solution {  
  void helper(vec<vec<int>> &res, vec<int> &level, vec<int> &nums, int index) {  
    res.push_back({level});  
    for (int i = index; i < nums.size(); i++) {  
      if (i != index && nums[i] == nums[i - 1])  
        continue;  
  
      level.push_back(nums[i]);  
      helper(res, level, nums, i + 1);  
      level.pop_back();  
    }  
  }  
  
public:  
  vec<vec<int>> subsetsWithDup(vec<int> &nums) {  
    vec<vec<int>> res;  
    std::sort(nums.begin(), nums.end());  
    vec<int> level;  
    helper(res, level, nums, 0);  
    return res;  
  }  
};
```