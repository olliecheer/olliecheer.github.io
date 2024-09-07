---
tags:
  - binary_search_tree
  - dfs
  - dynamic_programming
---


![[problems/pictures/Pasted image 20240908023644.png]]

```c++
class Solution_iterative {  
public:  
  int numTrees(int n) {  
    vec<int> dp(n + 1);  
    dp[0] = 1;  
    dp[1] = 1;  
  
    for (int i = 2; i <= n; i++) {  
      for (int j = 1; j <= i; j++) {  
        dp[i] += dp[j - 1] * dp[i - j];  
      }  
    }  
  
    return dp[n];  
  }  
};
```


```c++
class Solution_dfs {  
  int dfs(int num, vec<int> &memo) {  
    if (num == 0 || num == 1)  
      return 1;  
  
    if (memo[num] != num)  
      return memo[num];  
  
    int sum = 0;  
    for (int i = 1; i <= num; i++)  
      sum += dfs(i - 1, memo) * dfs(num - i, memo);  
  
    memo[num] = sum;  
    return sum;  
  }  
  
public:  
  int numTrees(int n) {  
    vec<int> memo(n + 1);  
    return dfs(n, memo);  
  }  
};
```