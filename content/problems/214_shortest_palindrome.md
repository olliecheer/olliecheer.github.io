---
tags:
  - palindrome
---
![[problems/pictures/Pasted image 20240908190429.png]]

```c++
class Solution {  
  long BASE = 26, MOD = (long)1e9 + 7;  
  long aL = 1;  
  
public:  
  std::string shortestPalindrome(std::string &s) {  
    int N = s.size();  
    int pos = -1;  
    long hash1 = 0, hash2 = 0;  
  
    for (int i = 0; i < N; i++) {  
      hash1 = (hash1 * BASE + s[i] - 'a') % MOD;  
      hash2 = (hash2 + (s[i] - 'a') * aL) % MOD;  
      if (hash1 == hash2)  
        pos = i;  
      aL = aL * BASE % MOD;  
    }  
  
    std::string res(s.begin() + pos + 1, s.end());  
    std::reverse(res.begin(), res.end());  
    res.append(s);  
    return res;  
  }  
};
```