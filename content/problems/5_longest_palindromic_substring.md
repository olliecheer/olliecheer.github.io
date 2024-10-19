---
tags:
  - longest_substring
  - palindrome
  - dynamic_programming
  - dfs
  - expand
  - manacher
---
![[problems/pictures/Pasted image 20241012194729.png]]


## Dynamic Programming

$T(n) = O(n^2)$

```c++
template <typename T>
using vec = std::vector<T>;

class Solution {
 public:
  std::string longestPalindrome(std::string &s) {
    int N = s.size();
    vec<vec<bool>> dp(N, vec<bool>(N));
    int start = 0, end = 0;
    for (int i = N - 1; i >= 0; i--) {
      for (int j = i; j < N; j++) {
        if (i == j)
          dp[i][j] = true;
        else if (i + 1 == j) {
          if (s[i] == s[j]) {
            dp[i][j] = true;
            if (j - i > end - start) {
              start = i;
              end = j;
            }
          }
        } else if (s[i] == s[j] && dp[i + 1][j - 1]) {
          dp[i][j] = true;
          if (j - i > end - start) {
            start = i;
            end = j;
          }
        }
      }
    }

    return s.substr(start, end - start + 1);
  }
};
```

## Expand from Middle

$T(n) = O(n^2)$

```c++
class Solution {
  int max_size_start = 0;
  int max_size = 0;

  void expand(std::string s, int cur, int offset) {
    int left = cur, right = cur + offset;
    for (; left >= 0 && right < s.size() && s[left] == s[right];
         left--, right++);

    left++;
    right--;

    int sz = right - left + 1;
    if (sz > max_size) {
      max_size_start = left;
      max_size = sz;
    }
  }

 public:
  std::string longestPalindrome(std::string s) {
    for (int i = 0; i < s.size(); i++) {
      expand(s, i, 0);
      expand(s, i, 1);
    }
    return s.substr(max_size_start, max_size);
  }
};
```

## Manacher Algorithm