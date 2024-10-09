---
tags:
  - palindrome
  - rolling_hash
  - rabin_karp
---
![[problems/pictures/Pasted image 20240908190429.png]]


## rolling_hash / rabin_karp

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  long BASE = 26, MOD = (long)1e9 + 7;
  long power = 1;

public:
  std::string shortestPalindrome(std::string &s) {
    int N = s.size();
    int pos = -1;
    long hash1 = 0, hash2 = 0;

    for (int i = 0; i < N; i++) {
      hash1 = (hash1 * BASE + s[i] - 'a') % MOD;
      hash2 = (hash2 + (s[i] - 'a') * power) % MOD;
      if (hash1 == hash2)
        pos = i;
      power = power * BASE % MOD;
    }

    std::string res(s.begin() + pos + 1, s.end());
    std::reverse(res.begin(), res.end());
    res.append(s);
    return res;
  }
};
```
