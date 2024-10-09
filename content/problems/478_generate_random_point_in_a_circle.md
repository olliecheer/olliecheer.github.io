---
tags:
---
![[problems/pictures/Pasted image 20240909223722.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  std::mt19937 rng{std::random_device{}()};
  std::uniform_real_distribution<double> uni{0, 1};

  double r, x, y;

public:
  Solution(double radius, double x_center, double y_center)
      : r(radius), x(x_center), y(y_center) {}

  vec<double> randPoint() {
    double d = r * std::sqrt(uni(rng));
    double theta = uni(rng) * 2 * M_PI;
    return {d * std::cos(theta) + x, d * sin(theta) + y};
  }
};
```
