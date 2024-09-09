---
tags: []
---

![[problems/pictures/Pasted image 20240909212905.png]]

```c++
class Solution {  
public:  
  std::string removeDuplicateLetters(std::string &s) {  
    std::stack<int> stk;  
    vec<int> last(128);  
  
    std::unordered_set<int> visited;  
    for (int i = 0; i < s.size(); i++)  
      last[s[i]] = i;  
  
    for (int i = 0; i < s.size(); i++) {  
      int c = s[i];  
      if (visited.count(c))  
        continue;  
  
      visited.insert(c);  
      while (!stk.empty() && c < stk.top() && i < last[stk.top()]) {  
        visited.erase(stk.top());  
        stk.pop();  
      }  
  
      stk.push(c);  
    }  
  
    std::string res;  
    while (!stk.empty()) {  
      res.push_back(stk.top());  
      stk.pop();  
    }  
  
    return res;  
  }  
};
```