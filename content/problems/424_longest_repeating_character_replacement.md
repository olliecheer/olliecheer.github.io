---
tags:
---

![[problems/pictures/Pasted image 20240909222016.png]]

```c++
class Solution {  
public:  
  int characterReplacement(std::string &s, int k) {  
    int N = s.size();  
    vec<int> count(26);  
    int left = 0, res = 0;  
    for (int i = 0; i < N; i++) {  
      count[s[i] - 'A']++;  
      while (i - left + 1 - *std::max_element(count.begin(), count.end()) > k) {  
        count[s[left] - 'A']--;  
        left++;  
      }  
  
      res = std::max(res, i - left + 1);  
    }  
  
    return res;  
  }  
};
```