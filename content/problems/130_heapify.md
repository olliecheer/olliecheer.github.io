---
tags:
  - heap_sort
---
![[pictures/Pasted image 20241013233737.png]]
![[pictures/Pasted image 20241013233747.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void siftDown(vec<int> &nums, int cur) {
    int min = cur;
    int left = 2 * cur + 1;
    int right = 2 * cur + 2;
    if (left < nums.size() && nums[left] < nums[min])
      min = left;

    if (right < nums.size() && nums[right] < nums[min])
      min = right;

    if (cur != min) {
      std::swap(nums[cur], nums[min]);
      siftDown(nums, min);
    }
  }

  void siftDown_iteration(vec<int> &nums, int cur) {
    int min = cur;

    while (true) {
      int left = 2 * cur + 1;
      int right = 2 * cur + 2;
      if (left < nums.size() && nums[left] < nums[min])
        min = left;

      if (right < nums.size() && nums[right] < nums[min])
        min = right;

      if (cur == min)
        break;

      std::swap(nums[cur], nums[min]);
      cur = min;
    }
  }

public:
  void heapify(vec<int> &nums) {
    for (int i = nums.size() / 2 - 1; i >= 0; i--)
      siftDown(nums, i);
  }
};
```