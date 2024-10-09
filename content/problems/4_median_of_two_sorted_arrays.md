---
tags:
  - median
  - binary_search
---
![[problems/pictures/Pasted image 20240907191852.png]]


```c++
template <typename T>
using vec = std::vector<T>;

template <typename T>
T median(T const &lower, T const &higher) {
  return lower + (higher - lower) / 2;
}

class Solution {
 public:
  double findMedianSortedArrays(vec<int> &numsX, vec<int> &numsY) {
    if (numsX.size() > numsY.size()) std::swap(numsX, numsY);

    int left = 0, right = numsX.size();
    while (left <= right) {
      int x = median(left, right);
      int y = (numsX.size() + numsY.size() + 1) / 2 - x;
      int x_left = (x == 0) ? INT_MIN : numsX[x - 1];
      int x_right = (x == numsX.size()) ? INT_MAX : numsX[x];
      int y_left = (y == 0) ? INT_MIN : numsY[y - 1];
      int y_right = (y == numsY.size()) ? INT_MAX : numsY[y];

      if (x_left <= y_right && y_left <= x_right) {
        if ((numsX.size() + numsY.size()) % 2 == 0)
          return median((double)std::max(x_left, y_left), (double)std::min(x_right, y_right));
        else
          return std::max(x_left, y_left);
      } else if (x_right > y_left)
        right = x - 1;
      else
        left = x + 1;
    }

    return -1;
  }
};
```