---
tags:
  - sort
---
![[problems/pictures/Pasted image 20240907234331.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  void sortColors(vec<int> &nums) {
    int left = 0, right = nums.size() - 1;

    for (int i = 0; i <= right; i++) {
      if (nums[i] == 0) {
        std::swap(nums[left], nums[i]);
        left++;
      }

      if (nums[i] == 2) {
        std::swap(nums[right], nums[i]);
        right--;
        if (nums[i] != 1)
          i--;
      }
    }
  }
};
```