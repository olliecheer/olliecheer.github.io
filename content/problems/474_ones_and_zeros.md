---
tags:
---
![[problems/pictures/Pasted image 20241014011028.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int findMaxForm(vec<std::string> &strs, int m, int n) {
    vec<vec<int>> dp(m + 1, vec<int>(n + 1));
    for (auto &s : strs) {
      int one = 0, zero = 0;
      for (char c : s) {
        if (c == '1')
          one++;
        else
          zero++;
      }

      for (int i = m; i >= zero; i--)
        for (int j = n; j >= one; j--)
          dp[i][j] = std::max(dp[i][j], dp[i - zero][j - one] + 1);
    }

    return dp[m][n];
  }
};
```
