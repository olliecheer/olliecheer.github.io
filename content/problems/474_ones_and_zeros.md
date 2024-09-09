---
tags:
---
![[problems/pictures/Pasted image 20240909223648.png]]

```c++
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
  
      for (int i = m; i >= zero; i--) {  
        for (int j = n; j >= one; j--) {  
          dp[i][j] = std::max(dp[i][j], dp[i - zero][j - one] + 1);  
        }  
      }  
    }  
  
    return dp[m][n];  
  }  
};
```