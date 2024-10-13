---
tags:
  - array
---
![[pictures/Pasted image 20241013234724.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maxProduct(vec<int> &nums) {
    int N = nums.size(), res = nums[0];
    vec<int> max(N), min(N);
    max[0] = nums[0];
    min[0] = nums[0];

    for (int i = 1; i < N; i++) {
      if (nums[i] > 0) {
        max[i] = std::max(nums[i], nums[i] * max[i - 1]);
        min[i] = std::min(nums[i], nums[i] * min[i - 1]);
      } else {
        max[i] = std::max(nums[i], nums[i] * min[i - 1]);
        min[i] = std::min(nums[i], nums[i] * max[i - 1]);
      }

      res = std::max(res, max[i]);
    }

    return res;
  }
};
```