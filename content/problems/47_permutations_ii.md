---
tags:
  - permutation
  - backtrack
  - dfs
---
![[problems/pictures/Pasted image 20241012200127.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void backtrack(vec<vec<int>> &res, vec<int> &tmp, vec<int> &nums,
                 vec<bool> &visited) {
    if (tmp.size() == nums.size())
      res.push_back(tmp);
    else {
      for (int i = 0; i < nums.size(); i++) {
        // When a number has the same value with its previous, we can use this
        // number only if the previous is used.
        if (visited[i] || i > 0 && nums[i] == nums[i - 1] && !visited[i - 1])
          continue;

        visited[i] = true;
        tmp.push_back(nums[i]);
        backtrack(res, tmp, nums, visited);
        tmp.pop_back();
        visited[i] = false;
      }
    }
  }

public:
  vec<vec<int>> permuteUnique(vec<int> &nums) {
    vec<vec<int>> res;
    vec<int> tmp;
    vec<bool> visited(nums.size());
    std::sort(nums.begin(), nums.end());
    backtrack(res, tmp, nums, visited);
    return res;
  }
};
```
