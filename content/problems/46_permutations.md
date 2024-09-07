---
tags:
  - permutation
  - dfs
---
![[problems/pictures/Pasted image 20240907224555.png]]

```c++
class Solution {  
  void dfs(vec<vec<int>> &res, vec<int> &tmp, vec<int> &nums) {  
    if (tmp.size() == nums.size()) {  
      res.push_back(tmp);  
      return;  
    }  
  
    for (int i = 0; i < nums.size(); i++) {  
      if (std::find(tmp.begin(), tmp.end(), nums[i]) != tmp.end())  
        continue;  
  
      tmp.push_back(nums[i]);  
      dfs(res, tmp, nums);  
      tmp.pop_back();  
    }  
  }  
  
public:  
  vec<vec<int>> permute(vec<int> nums) {  
    vec<vec<int>> res;  
    vec<int> tmp;  
    std::sort(nums.begin(), nums.end());  
    dfs(res, tmp, nums);  
    return res;  
  }  
};
```