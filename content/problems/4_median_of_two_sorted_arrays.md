---
tags:
  - median
---
![[problems/pictures/Pasted image 20240907191852.png]]


```c++
class Solution {  
public:  
  double findMedianSortedArrays(vec<int> &numsX, vec<int> &numsY) {  
    if (numsX.size() > numsY.size())  
      std::swap(numsX, numsY);  
  
    int left = 0, right = numsX.size();  
    while (left <= right) {  
      int x = left + (right - left) / 2;  
      int y = (numsX.size() + numsY.size() + 1) / 2 - x;  
      int x_left = (x == 0) ? std::numeric_limits<int>::min() : numsX[x - 1];  
      int x_right =  
          (x == numsX.size()) ? std::numeric_limits<int>::max() : numsX[x];  
      int y_left = (y == 0) ? std::numeric_limits<int>::min() : numsY[y - 1];  
      int y_right =  
          (y == numsX.size()) ? std::numeric_limits<int>::max() : numsY[y];  
  
      if (x_left <= y_right && y_left <= x_right) {  
        if ((numsX.size() + numsY.size()) % 2 == 0)  
          return ((double)std::max(x_left, y_left) +  
                  std::min(x_right, y_right)) /  
                 2;  
        else  
          return (double)std::max(x_left, y_left);  
      } else if (x_right > y_left)  
        right = x - 1;  
      else  
        left = x + 1;  
    }  
  
    return -1;  
  }  
};
```