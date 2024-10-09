---
tags:
  - palindrome
---
![[problems/pictures/Pasted image 20240909231933.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  bool is_palindrome(std::string &s, int i, int j) {
    while (i < j) {
      if (s[i] == s[j]) {
        i++;
        j--;
      } else
        return false;
    }
    return true;
  }

public:
  bool validPalindrome(std::string &s) {
    int i = 0, j = s.size() - 1;
    while (i < j && s[i] == s[j]) {
      i++;
      j--;
    }

    if (i >= j)
      return true;

    return is_palindrome(s, i + 1, j) || is_palindrome(s, i, j - 1);
  }
};
```
