---
tags:
  - parentheses
---
![[problems/pictures/Pasted image 20240910015103.png]]


```c++
class Solution {  
public:  
  int matDepth(std::string s) {  
    int res = 0, count = 0;  
    for (char c : s) {  
      if (c == '(')  
        count++;  
      else if (c == ')')  
        count--;  
      res = std::max(res, count);  
    }  
  
    return res;  
  }  
};
```