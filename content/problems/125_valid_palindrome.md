---
tags:
  - palindrome
---
![[problems/pictures/Pasted image 20241013233546.png]]



```c++
class Solution {
public:
  bool isPalindrome(std::string s) {
    int left = 0, right = s.size() - 1;
    while (left < right) {
      for (; left < right && !std::isalnum(s[left]); left++)
        ;
      for (; left < right && !std::isalnum(s[right]); right--)
        ;

      if (left <= right && std::tolower(s[left]) != std::tolower(s[right]))
        return false;

      left++;
      right--;
    }

    return true;
  }
};
```