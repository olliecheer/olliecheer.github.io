---
tags:
  - dynamic_programming
---
![[problems/pictures/Pasted image 20241013225211.png]]
![[problems/pictures/Pasted image 20241013225228.png]]
![[problems/pictures/Pasted image 20241013225239.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<int>> dp{32, vec<int>(32)};

  std::string getPath(int r, int c, int k) {
    if (r == 0 && c == 0)
      return "";

    if (r == 0)
      return "H" + getPath(r, c - 1, k);
    else if (c == 0)
      return "V" + getPath(r - 1, c, k);
    else if (k <= dp[r + c - 1][c - 1])
      return "H" + getPath(r, c - 1, k);
    else
      return "V" + getPath(r - 1, c, k - dp[r + c - 1][c - 1]);
  }

  void makeTriangle() {
    dp[0][0] = 1;
    for (int i = 1; i < dp.size(); i++) {
      dp[i][0] = 1;
      for (int j = 1; j <= i; j++)
        dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j];
    }
  }

public:
  std::string kthSmallestPath(vec<int> d, int k) {
    makeTriangle();
    return getPath(d[0], d[1], k);
  }
};
```