---
tags:
  - shuffle
  - array
---
![[problems/pictures/Pasted image 20241014005228.png]]
![[problems/pictures/Pasted image 20241014005236.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<int> nums, orig;

public:
  explicit Solution(vec<int> &nums) : nums{nums}, orig{nums} {}

  vec<int> reset() {
    nums = orig;
    return nums;
  }

  vec<int> shuffle() {
    for (int i = 0; i < nums.size(); i++) {
      int j = i + rand() % (nums.size() - i);
      std::swap(nums[i], nums[j]);
    }

    return nums;
  }
};
```