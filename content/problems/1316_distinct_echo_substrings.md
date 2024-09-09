---
tags:
  - substring
  - mod
---


![[problems/pictures/Pasted image 20240910011810.png]]

```c++
class Solution {  
  long BASE = 26l, MOD = (long)1e9 + 7;  
  
  long getHash(int left, int right, vec<long> &prefix, vec<long> &pow) {  
    return (prefix[right] - prefix[left] * pow[right - left] % MOD + MOD) % MOD;  
  }  
  
public:  
  int distinctEchoSubstrings(std::string &s) {  
    std::unordered_set<long> st;  
    int N = s.size();  
    vec<long> prefix(N + 1), pow(N + 1);  
    pow[0] = 1;  
  
    for (int i = 1; i <= N; i++) {  
      prefix[i] = (prefix[i - 1] * BASE + s[i - 1]) % MOD;  
      pow[i] = pow[i - 1] * BASE % MOD;  
    }  
  
    for (int i = 0; i < N; i++) {  
      for (int len = 2; i + len <= N; len += 2) {  
        int mid = i + len / 2;  
        long hash1 = getHash(i, mid, prefix, pow);  
        long hash2 = getHash(mid, i + len, prefix, pow);  
        if (hash1 == hash2)  
          st.insert(hash1);  
      }  
    }  
  
    return st.size();  
  }  
};
```