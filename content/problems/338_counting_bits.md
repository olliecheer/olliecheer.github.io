---
tags:
---
![[problems/pictures/Pasted image 20240909213317.png]]

```c++
class Solution {  
public:  
  vec<int> countBits(int num) {  
    vec<int> res(num + 1);  
    for (int i = 1; i <= num; i++)  
      res[i] = res[i / 2] + (i % 2);  
  
    return res;  
  }  
};
```


```c++
class Solution_2 {  
public:  
  vec<int> countBits(int num) {  
    vec<int> res(num + 1);  
    for (int i = 1; i <= num; i++)  
      res[i] = res[i & (i - 1)] + 1;  
  
    return res;  
  }  
};
```