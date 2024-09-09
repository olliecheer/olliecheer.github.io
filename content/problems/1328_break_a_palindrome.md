---
tags:
  - palindrome
---
![[problems/pictures/Pasted image 20240910011848.png]]

```c++
class Solution {  
public:  
  std::string breakPalindrome(std::string palindrome) {  
    int nr = palindrome.size();  
    for (int i = 0; i < nr / 2; i++) {  
      if (palindrome[i] != 'a') {  
        palindrome[i] = 'a';  
        return palindrome;  
      }  
    }  
    palindrome.back() = 'b';  
    return nr < 2 ? "" : palindrome;  
  }  
};
```