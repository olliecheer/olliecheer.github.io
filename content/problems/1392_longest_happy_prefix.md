---
tags:
---
![[problems/pictures/Pasted image 20240910012623.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  std::string longestPrefix(std::string &s) {
    long prefix = 0, suffix = 0, power = 1, res = 0;
    long MOD = (long)1e9;

    for (int i = 0, j = s.size() - 1; j > 0; i++, j--) {
      int first = s[i] - 'a';
      int last = s[j] - 'a';

      prefix = (prefix * 26 + first) % MOD;
      suffix = (suffix + power * last) % MOD;
      power = power * 26 % MOD;
      if (prefix == suffix)
        res = i + 1;
    }

    s.resize(res);

    return s;
  }
};
```