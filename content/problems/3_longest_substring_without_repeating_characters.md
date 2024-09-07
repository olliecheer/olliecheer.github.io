---
tags:
  - longest_substring
---
![[problems/pictures/Pasted image 20240907191719.png]]

```c++
class Solution {  
public:  
  int lengthOfLongestSubstring(std::string s) {  
    int nr = s.size();  
    if (nr <= 1) {  
      return nr;  
    }  
  
    vec<int> last_posi(128, -1);  
    int res = 0;  
    for (int left = 0, right = 0; right < nr; right++) {  
      if (last_posi[s[right]] >= left) {  
        left = last_posi[s[right]] + 1;  
      }  
      last_posi[s[right]] = right;  
      res = std::max(res, right - left + 1);  
    }  
  
    return res;  
  }  
};
```