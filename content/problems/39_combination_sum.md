---
tags:
  - array
  - combination
  - recursion
  - dfs
---
![[problems/pictures/Pasted image 20240907224104.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<int>> res;

  void dfs(vec<int> &candidates, int index, vec<int> &tmp, int target) {
    if (index == candidates.size()) {
      if (target == 0) {
        res.push_back(tmp);
      }
      return;
    }

    dfs(candidates, index + 1, tmp, target);
    if (target - candidates[index] >= 0) {
      tmp.push_back(candidates[index]);
      dfs(candidates, index, tmp, target - candidates[index]);
      tmp.pop_back();
    }
  }

public:
  vec<vec<int>> combinationSum(vec<int> &candidates, int target) {
    vec<int> tmp;
    dfs(candidates, 0, tmp, target);
    return res;
  }
};
```
