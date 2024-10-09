---
tags:
  - sort
---
![[problems/pictures/Pasted image 20240908190504.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int findKthLargest(vector<int> &nums, int k) {
    quick_sort(nums, 0, nums.size() - 1);
    return nums[nums.size() - k];
  }

  void quick_sort(vector<int> &nums, int left, int right) {
    if (left >= right)
      return;

    std::swap(nums[left], nums[left + (rand() % (right - left + 1))]);

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
};
```