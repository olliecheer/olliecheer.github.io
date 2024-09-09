---
tags:
---

// vip



```c++
class Solution {  
public:  
  int lengthOfLongestSubstringKDistinct(std::string &s, int k) {  
    vec<char> mp(128, 0);  
    int left = 0;  
    int res = 0;  
    for (int i = 0; i < s.size(); i++) {  
      char cur = s[i];  
      mp[cur]++;  
      while (mp.size() > k) {  
        char c = s[left];  
        mp[c]--;  
        left++;  
      }  
      res = std::max(res, i - left + 1);  
    }  
    return res;  
  }  
};
```