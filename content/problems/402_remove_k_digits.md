---
tags:
  - stack
---
![[problems/pictures/Pasted image 20240909221045.png]]

```c++
class Solution {  
public:  
  std::string removeKdigites(std::string &num, int k) {  
    std::stack<char> stk;  
    for (char c : num) {  
      while (!stk.empty() && k > 0 && c < stk.top()) {  
        stk.pop();  
        k--;  
      }  
  
      stk.push(c);  
    }  
  
    while (k > 0) {  
      k--;  
      stk.pop();  
    }  
  
    std::string res;  
    bool zero = true;  
    while (!stk.empty()) {  
      int e = stk.top();  
      stk.pop();  
      if (e == '0' && zero)  
        continue;  
      else  
        zero = false;  
      res.push_back(e - '0');  
    }  
  
    return res.empty() ? "0" : res;  
  }  
};
```