---
tags:
  - matrix
---
![[problems/pictures/Pasted image 20241014000743.png]]
![[problems/pictures/Pasted image 20241014000753.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maximalSquare(vec<vec<char>> &matrix) {
    int M = matrix.size(), N = matrix[0].size();
    vec<vec<int>> dp(M, vec<int>(N));
    int max_value = 0;
    for (int i = 0; i < M; i++) {
      for (int j = 0; j < N; j++) {
        if (i == 0 || j == 0) {
          if (matrix[i][j] == '1')
            dp[i][j] = 1;
        } else {
          if (matrix[i][j] == '1')
            dp[i][j] =
                std::min({dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]}) + 1;
        }
        max_value = std::max(dp[i][j], max_value);
      }
    }

    return max_value * max_value;
  }
};
```