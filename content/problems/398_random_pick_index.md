---
tags:
  - random
  - reservoir_sampling
---
![[pictures/Pasted image 20241014005355.png]]
![[pictures/Pasted image 20241014005404.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<int> nums;

public:
  explicit Solution(vec<int> _nums) : nums{std::move(_nums)} {}

  int pick(int target) {
    int res;

    for (int i = 0, cnt = 0; i < nums.size(); i++) {
      if (nums[i] == target) {
        cnt++;
        if (rand() % cnt == 0)
          res = i;
      }
    }

    return res;
  }
};
```