---
tags:
  - pow_mod
  - permutation
---

![[problems/pictures/Pasted image 20240910023455.png]]
![[problems/pictures/Pasted image 20240910023502.png]]



```c++
// 正难则反，只有全部顺时针和全部逆时针才不会碰撞。
class Solution {  
public:  
  int monkeyMove(int n) { return (pow_mod(2, n, MOD) - 2 + MOD) % MOD; }  
  
  uint64_t MOD = 1e9 + 7;  
  
  uint64_t pow_mod(uint64_t a, uint64_t b, uint64_t c) {  
    int res = 1;  
    while (b) {  
      if (b % 2)  
        res = (res * a) % c;  
  
      b /= 2;  
      a = (a * a) % c;  
    }  
    return res;  
  }  
};
```