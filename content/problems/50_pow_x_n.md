---
tags:
  - pow
  - recursion
  - iteration
---
![[problems/pictures/Pasted image 20240907232650.png]]

```c++
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
  
    if (n < 0) {  
      x = 1 / x;  
      n = -n;  
    }  
  
    return pow(x, n);  
  }  
};
```


```c++
class Solution_iterative {  
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


## Extended

```c++
double fast_pow(double x, unsigned long n) {  
  if (n == 0)  
    return 1.0;  
  
  double half = fast_pow(x, n / 2);  
  return n % 2 ? half * half * x : half * half;  
}  
  
double my_pow(double x, long n) {  
  if (n < 0) {  
    x = 1 / x;  
    n = -n;  
  }  
  
  return fast_pow(x, n);  
}  
  
//   a^b % c  
// = (a^2)^(b/2) % c if b % 2 == 0  
// = (a^2)^(b/2) * a % c if b % 2 == 1  
  
// O(logn)  
int pow_mod(int a, int b, int c) {  
  int res = 1;  
  
  while (b) {  
    if (b % 2)  
      res = (res * a) % c;  
  
    b /= 2;  
    a = (a * a) % c;  
  }  
  
  return res;  
}
```
