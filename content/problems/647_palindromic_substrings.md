---
tags:
  - palindrome
---
![[problems/pictures/Pasted image 20240909230637.png]]

```c++
class Solution_dp {  
public:  
  int countSubstrings(std::string &s) {  
    int N = s.size();  
    int res = 0;  
    vec<vec<bool>> dp(N, vec<bool>(N));  
    for (int i = N - 1; i >= 0; i--) {  
      for (int j = i; j < N; j++) {  
        dp[i][j] = (s[i] == s[j] && (j - i <= 2 || dp[i + 1][j - 1]));  
        if (dp[i][j])  
          res++;  
      }  
    }  
  
    return res;  
  }  
};  
  
class Solution_center_span {  
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