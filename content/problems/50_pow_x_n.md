---
tags:
  - pow
  - recursion
  - iteration
---
![[pictures/Pasted image 20241012200223.png]]
![[pictures/Pasted image 20241012200235.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  static double pow(double x, int n) {
    if (n == 0)
      return 1;

    double y = pow(x, n / 2);
    if (n % 2)
      return y * y * x;
    else
      return y * y;
  }

public:
  double myPow(double x, int n) {
    if (x == 0 || x == 1)
      return x;

    long N = n;

    if (N < 0) {
      x = 1 / x;
      N = -N;
    }

    return pow(x, N);
  }
};
```


```c++
class Solution {  
public:  
  double myPow(double x, int n) {  
    long N = n;  
    if (N < 0) {  
      x = 1 / x;  
      N = -N;  
    }  
  
    double res = 1;  
    double current_product = x;  
  
    for (long i = N; i > 0; i /= 2) {  
      if ((i % 2) == 1)  
        res = res * current_product;  
  
      current_product = current_product * current_product;  
    }  
  
    return res;  
  }  
};
```
