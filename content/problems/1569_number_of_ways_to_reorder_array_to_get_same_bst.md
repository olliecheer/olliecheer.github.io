---
tags:
  - array
  - mod
  - dynamic_programming
---
![[pictures/Pasted image 20241013224725.png]]
![[pictures/Pasted image 20241013224744.png]]
![[pictures/Pasted image 20241013224755.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<std::optional<long>>> memo;
  int MOD = (int)1e9 + 7;

  long nCk(int n, int k) {
    if (k == 0 || n == k)
      return 1;

    if (!memo[n][k])
      memo[n][k] = (nCk(n - 1, k - 1) + nCk(n - 1, k)) % MOD;

    return memo[n][k].value();
  }

  long totalWays(vec<int> &t) {
    if (t.empty())
      return 1;

    vec<int> left, right;
    int head = t[0];

    for (int i = 1; i < t.size(); i++) {
      if (t[i] > head)
        right.push_back(t[i]);
      else
        left.push_back(t[i]);
    }

    long cnt = (totalWays(left) * totalWays(right)) % MOD;
    long comb = nCk(t.size() - 1, left.size());
    return (comb * cnt) % MOD;
  }

public:
  int numOfWays(vec<int> &nums) {
    int n = nums.size();
    memo = vec<vec<std::optional<long>>>(n, vec<std::optional<long>>(n));
    vec<int> left;
    for (int i : nums)
      left.push_back(i);

    long res = (MOD + totalWays(left) - 1) % MOD;
    return (int)res;
  }
};
```