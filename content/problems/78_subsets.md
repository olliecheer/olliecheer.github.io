---
tags:
  - backtrack
---
![[problems/pictures/Pasted image 20241012201323.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<int>> res;

  void backtrack(vec<int> const &nums, vec<int> &tmp, int start) {
    res.push_back(tmp);
    for (int i = start; i < nums.size(); i++) {
      tmp.push_back(nums[i]);
      backtrack(nums, tmp, i + 1);
      tmp.pop_back();
    }
  }

public:
  vec<vec<int>> subsets(vec<int> nums) {
    vec<int> tmp;
    backtrack(nums, tmp, 0);
    return res;
  }
};
```