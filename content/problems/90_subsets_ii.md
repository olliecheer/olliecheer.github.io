---
tags:
  - subset
  - array
  - combination
  - dfs
---
![[problems/pictures/Pasted image 20240908023016.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void dfs(vec<vec<int>> &res, vec<int> &tmp, vec<int> &nums, int index) {
    res.push_back({tmp});
    for (int i = index; i < nums.size(); i++) {
      if (i != index && nums[i] == nums[i - 1])
        continue;

      tmp.push_back(nums[i]);
      dfs(res, tmp, nums, i + 1);
      tmp.pop_back();
    }
  }

public:
  vec<vec<int>> subsetsWithDup(vec<int> &nums) {
    vec<vec<int>> res;
    std::sort(nums.begin(), nums.end());
    vec<int> tmp;
    dfs(res, tmp, nums, 0);
    return res;
  }
};
```