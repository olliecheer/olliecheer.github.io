---
tags:
  - random
---
![[problems/pictures/Pasted image 20241014010921.png]]
![[problems/pictures/Pasted image 20241014010929.png]]



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
