---
tags:
---
![[problems/pictures/Pasted image 20240909223722.png]]

```c++
class Solution {  
  double r, x, y;  
  
public:  
  Solution(double radius, double x_center, double y_center)  
      : r(radius), x(x_center), y(y_center) {}  
  
  vec<double> randPoint() {  
    double x0 = x - r, y0 = y - r;  
    while (true) {  
      double rand_x = y0 + rand() * r * 2;  
      double rand_y = y0 + rand() * r * 2;  
  
      if (std::sqrt(std::pow(rand_x - x, 2) + std::pow(rand_y - y, 2)) <= r)  
        return {rand_x, rand_y};  
    }  
  }  
};
```