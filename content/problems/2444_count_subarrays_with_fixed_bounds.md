---
tags:
  - mod
  - subarray
---
![[pictures/Pasted image 20241013230311.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  long long countSubarrays(vec<int> &nums, int minK, int maxK) {
    long long res = 0;
    int min_position = -1, max_position = -1, left_bound = -1;
    for (int i = 0; i < nums.size(); i++) {
      if (nums[i] < minK || nums[i] > maxK)
        left_bound = i;
      if (nums[i] == minK)
        min_position = i;

      if (nums[i] == maxK)
        max_position = i;

      res += std::max(0, std::min(max_position, min_position) - left_bound);
    }

    return res;
  }
};
```