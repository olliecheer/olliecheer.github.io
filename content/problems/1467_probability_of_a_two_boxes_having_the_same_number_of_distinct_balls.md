---
tags:
---
![[pictures/Pasted image 20241013224143.png]]
![[pictures/Pasted image 20241013224158.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<double> dp;

  double nCk(int a, int b) { return dp[a] / dp[b] / dp[a - b]; }

  double dfs(int count1, int count2, int sum1, int sum2, vec<int> &balls,
             int i) {
    if (i == balls.size())
      return (sum1 == sum2 && count1 == count2) ? 1 : 0;

    double res = dfs(count1 + 1, count2, sum1 + balls[i], sum2, balls, i + 1);
    res += dfs(count1, count2 + 1, sum1, sum2 + balls[i], balls, i + 1);

    for (int j = 1; j < balls[i]; j++)
      res += nCk(balls[i], j) * dfs(count1 + 1, count2 + 1, sum1 + j,
                                    sum2 + balls[i] - j, balls, i + 1);

    return res;
  }

public:
  double getProbability(vec<int> &balls) {
    dp = vec<double>(100);
    dp[0] = 1;
    int sum = std::accumulate(balls.begin(), balls.end(), 0);
    for (int i = 1; i < 100; i++)
      dp[i] = dp[i - 1] * i;

    double valid_number = dfs(0, 0, 0, 0, balls, 0);
    double total_number = nCk(sum, sum / 2);

    return valid_number / total_number;
  }
};
```