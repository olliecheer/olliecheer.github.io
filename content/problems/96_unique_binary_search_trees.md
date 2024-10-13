---
tags:
  - binary_search_tree
  - dfs
  - dynamic_programming
---
![[pictures/Pasted image 20241013232005.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
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
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  int dfs(int num, vec<int> &memo) {
    if (num == 0 || num == 1)
      return 1;

    if (memo[num])
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