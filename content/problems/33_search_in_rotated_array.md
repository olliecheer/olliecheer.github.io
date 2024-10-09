---
tags:
  - rotate
  - array
  - binary_search
---
![[problems/pictures/Pasted image 20240907223655.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int search(vec<int> nums, int target) {
    int left = 0, right = nums.size() - 1;
    while (left <= right) {
      int mid = left + (right - left) / 2;
      if (nums[mid] == target)
        return mid;
      else if (nums[mid] >= nums[left]) {
        if (target >= nums[left] && target < nums[mid])
          right = mid - 1;
        else
          left = mid + 1;
      } else {
        if (target <= nums[right] && target > nums[mid])
          left = mid + 1;
        else
          right = mid - 1;
      }
    }

    return -1;
  }
};
```