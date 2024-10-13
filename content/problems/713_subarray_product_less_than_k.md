---
tags:
  - subarray
  - product
---
![[pictures/Pasted image 20241011094033.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int numSubarrayProductLessThanK(vec<int> &nums, int k) {
    if (k <= 1)
      return 0;

    int res = 0, left = 0, product = 1;
    for (int right = 0; right < nums.size(); right++) {
      product *= nums[right];
      while (product >= k) {
        product /= nums[left];
        left++;
      }
      res += right - left + 1;
    }

    return res;
  }
};
```
