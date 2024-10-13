---
tags:
  - palindrome
  - dynamic_programming
  - dp_array
---
![[pictures/Pasted image 20241011083724.png]]


### Dynamic Programming

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int countSubstrings(std::string &s) {
    int N = s.size();
    int res = 0;
    vec<vec<bool>> dp(N, vec<bool>(N));
    for (int i = N - 1; i >= 0; i--)
      for (int j = i; j < N; j++)
        if (s[i] == s[j] && (j - i <= 2 || dp[i + 1][j - 1])) {
          dp[i][j] = true;
          res++;
        }

    return res;
  }
};
```


### Center Span

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int count = 1;

  void checkPalindrome(std::string &s, int i, int j) {
    while (i >= 0 && j < s.size() && s[i] == s[j]) {
      count++;
      i--;
      j++;
    }
  }

public:
  int countSubstrings(std::string &s) {
    if (s.empty())
      return 0;

    for (int i = 0; i < s.size() - 1; i++) {
      checkPalindrome(s, i, i);
      checkPalindrome(s, i, i + 1);
    }
    return count;
  }
};
```
