---
tags:
  - prime
---
![[problems/pictures/Pasted image 20240910023120.png]]


```c++
class Solution {  
  int find_next(int n) {  
    int sum = 0;  
    int pre = n;  
    for (int i = 2; i <= std::sqrt(pre); i++) {  
      while (pre % i == 0) {  
        sum += i;  
        pre /= i;  
      }  
    }  
  
    if (pre != 1)  
      sum += pre;  
  
    return sum;  
  }  
  
  int find_next_2(int n) {  
    int sum = 0;  
    int pre = n;  
    for (int i = 2; i <= n; i++) {  
      while (pre % i == 0) {  
        sum += i;  
        pre /= i;  
      }  
    }  
  
    return sum;  
  }  
  
public:  
  int smallestValue(int n) {  
    while (true) {  
      int next = find_next(n);  
      if (next == n)  
        break;  
  
      n = next;  
    }  
  
    return n;  
  }  
};
```