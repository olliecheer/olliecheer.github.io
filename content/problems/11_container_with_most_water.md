---
tags:
  - containing_water
  - dual_pointers
  - greedy
---
![[pictures/Pasted image 20241012194939.png]]
![[pictures/Pasted image 20241012194954.png]]
![[pictures/Pasted image 20241012195004.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maxArea(vec<int> &height) {
    int left = 0, right = height.size() - 1;
    int res = 0;

    while (left < right) {
      auto area = std::min(height[left], height[right]) * (right - left);
      res = std::max(res, area);
      if (height[left] <= height[right])
        left++;
      else
        right--;
    }

    return res;
  }
};
```