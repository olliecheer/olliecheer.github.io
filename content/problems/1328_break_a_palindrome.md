---
tags:
  - palindrome
---
![[pictures/Pasted image 20241013223222.png]]
![[pictures/Pasted image 20241013223233.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  std::string breakPalindrome(std::string palindrome) {
    int nr = palindrome.size();
    for (int i = 0; i < nr / 2; i++)
      if (palindrome[i] != 'a') {
        palindrome[i] = 'a';
        return palindrome;
      }

    palindrome.back() = 'b';
    return nr < 2 ? "" : palindrome;
  }
};
```