---
tags:
  - sort
---
![[problems/pictures/Pasted image 20241014000518.png]]
![[problems/pictures/Pasted image 20241014000530.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void quick_sort(vec<int> &nums, int left, int right) {
    if (left >= right)
      return;

    int pivot = nums[left];
    int i = left, j = right;

    while (i < j) {
      while (i < j && nums[j] >= pivot)
        j--;
      while (i < j && nums[i] <= pivot)
        i++;
      if (i != j)
        std::swap(nums[i], nums[j]);
    }

    std::swap(nums[left], nums[i]);
    quick_sort(nums, left, i - 1);
    quick_sort(nums, i + 1, right);
  }

public:
  bool containsDuplicate(vec<int> &nums) {
    quick_sort(nums, 0, nums.size() - 1);
    for (int i = 0; i + 1 < nums.size(); i++) {
      if (nums[i] == nums[i + 1]) {
        return true;
      }
    }

    return false;
  }
};
```