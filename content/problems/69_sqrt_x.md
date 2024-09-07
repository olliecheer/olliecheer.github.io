---
tags:
  - recursion
---
![[problems/pictures/Pasted image 20240907234055.png]]


```c++
class Solution {  
  int mySqrt(int x, int min, int max) {  
    int mid = min + (max - min) / 2;  
    long mid_square = (long)mid * mid;  
    long mid_plus_one_square = (long)(mid + 1) * (mid + 1);  
  
    if (mid_square <= x && x < mid_plus_one_square)  
      return mid;  
  
    if (x < mid_square)  
      return mySqrt(x, min, mid);  
  
    if (mid_plus_one_square <= x)  
      return mySqrt(x, mid + 1, max);  
  
    return mid;  
  }  
  
public:  
  int mySqrt(int x) {  
    int min = 0;  
    int max = std::numeric_limits<int>::max();  
    return mySqrt(x, min, max);  
  }  
};
```