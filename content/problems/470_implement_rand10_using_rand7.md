---
tags:
  - random
---
![[problems/pictures/Pasted image 20240909223533.png]]

```c++
extern int rand7();  
  
class Solution {  
public:  
  int rand10() {  
    int first, second;  
    while ((first = rand7()) > 6)  
      ;  
    while ((second = rand7()) > 5)  
      ;  
    return (first & 1) == 1 ? second : 5 + second;  
  }  
};
```