---
tags:
  - palindrome
  - mod
---
![[pictures/Pasted image 20241013220237.png]]
![[pictures/Pasted image 20241013220246.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int MOD = 1e9 + 7;
  int a = 26;

public:
  int longestDecomposition(std::string &s) {
    int N = s.size();
    int p1 = 0, p2 = N - 1;
    int res = 0;
    long h1 = 0, h2 = 0, aL = 1;

    while (p1 <= p2) {
      int left = s[p1] - 'a' + 1;
      int right = s[p2] - 'a' + 1;

      h1 = (h1 * a + left) % MOD;
      h2 = (h2 + right * aL) % MOD;

      aL = aL * a % MOD;

      if (h1 == h2) {
        if (p1 == p2)
          res++;
        else
          res += 2;

        h1 = 0;
        h2 = 0;
        aL = 1;
      }

      p1++;
      p2--;
    }

    return h1 > 0 ? res + 1 : res;
  }
};
```