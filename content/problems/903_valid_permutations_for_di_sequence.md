---
tags:
  - permutation
  - mod
---
![[pictures/Pasted image 20241013201427.png]]
![[pictures/Pasted image 20241013201436.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int MOD = (int)1e9 + 7;
  vec<vec<int>> memo;

  int nCk(int n, int k) {
    if (k == 0 || k == n)
      return 1;

    if (memo[n][k] != 0)
      return memo[n][k];

    memo[n][k] = (nCk(n - 1, k) + nCk(n - 1, k - 1)) % MOD;
    return memo[n][k];
  }

  long helper(std::string s, std::unordered_map<std::string, long> &mp) {
    if (s.empty())
      return 1;

    if (mp.count(s))
      return mp[s];

    long res = 0;
    int N = s.size();
    if (s[0] == 'D')
      res = (res + helper(s.substr(1), mp)) % MOD;

    if (s[N - 1] == 'I')
      res = (res + helper(s.substr(0, N - 1), mp)) % MOD;

    for (int i = 1; i < N; i++) {
      if (s[i - 1] == 'I' && s[i] == 'D') {
        long left = helper(s.substr(0, i - 1), mp);
        long right = helper(s.substr(i + 1), mp);

        res += (((left * right) % MOD) * nCk(N, i)) % MOD;
        res %= MOD;
      }
    }

    mp.insert({s, res});
    return res;
  }

public:
  int numPermsDISequence(std::string &s) {
    int N = s.size();
    memo = vec<vec<int>>(N + 1, vec<int>(N + 1));
    std::unordered_map<std::string, long> mp;
    return helper(s, mp);
  }
};
```