---
tags:
  - prime
---
![[problems/pictures/Pasted image 20240910023338.png]]


```c++
class Solution {  
  vec<bool> prim;  
  
public:  
  int distinctPrimeFactors(vec<int> nums) {  
    prim = vec<bool>(1001, true);  
  
    int res = 0;  
    for (int i = 2; i * i <= 1000; i++)  
      if (prim[i])  
        for (int j = i * i; j <= 1000; j += i)  
          prim[j] = false;  
  
  out:  
    for (int i = 2; i <= 1000; i++)  
      if (prim[i])  
        for (int n : nums)  
          if (n % i == 0) {  
            res++;  
            goto out;  
          }  
  
    return res;  
  }  
};
```