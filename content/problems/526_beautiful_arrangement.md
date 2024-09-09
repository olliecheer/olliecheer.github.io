---
tags:
---

![[problems/pictures/Pasted image 20240909224903.png]]

```c++
class Solution {  
  vec<std::optional<int>> memo;  
  int N;  
  
  int dfs(int pos, int state) {  
    if (pos == 1)  
      return 1;  
  
    if (memo[state])  
      return memo[state].value();  
  
    int count = 0;  
    for (int i = 1; i <= N; i++) {  
      if ((state & (1 << (i - 1))) == 0 && (pos % i == 0 || i % pos == 0))  
        count += dfs(pos - 1, state | (1 << (i - 1)));  
    }  
  
    memo[state] = count;  
    return memo[state].value();  
  }  
  
public:  
  int countArrangement(int n) {  
    N = n;  
    memo = vec<std::optional<int>>(1 << n);  
    return dfs(n, 0);  
  }  
};
```