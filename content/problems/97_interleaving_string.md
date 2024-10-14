---
tags:
  - dynamic_programming
---
![[problems/pictures/Pasted image 20241013232033.png]]
![[problems/pictures/Pasted image 20241013232044.png]]
![[problems/pictures/Pasted image 20241013232051.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool isInterleave(std::string &s1, std::string &s2, std::string &s3) {
    int M = s1.size(), N = s2.size();
    if (M + N != s3.size())
      return false;

    vec<vec<bool>> dp(M + 1, vec<bool>(N + 1));
    dp[0][0] = true;

    for (int i = 1; i <= s1.size(); i++)
      dp[i][0] = (s3[i - 1] == s1[i - 1] && dp[i - 1][0]);

    for (int j = 1; j <= s2.size(); j++)
      dp[0][j] = (s3[j - 1] == s2[j - 1] && dp[0][j - 1]);

    for (int i = 1; i <= s1.size(); i++) {
      for (int j = 1; j <= s2.size(); j++) {
        dp[i][j] = (s3[i + j - 1] == s1[i - 1] && dp[i - 1][j]) ||
                   (s3[i + j - 1] == s2[j - 1] && dp[i][j - 1]);
      }
    }

    return dp[M][N];
  }
};
```