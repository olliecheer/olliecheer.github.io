---
tags:
  - dual_bfs
---
![[problems/pictures/Pasted image 20240910000431.png]]
![[problems/pictures/Pasted image 20240910000457.png]]


```c++
// Dual BFS  
class Solution {  
public:  
  int openLock(vec<std::string> &deadends, std::string &target) {  
    std::unordered_set<std::string> begin, end;  
    std::unordered_set<std::string> deads(deadends.begin(), deadends.end());  
  
    begin.insert("0000");  
    end.insert(target);  
  
    int level = 0;  
  
    while (!begin.empty() && !end.empty()) {  
      std::unordered_set<std::string> tmp;  
      for (auto &&s : begin) {  
        if (end.count(s))  
          return level;  
  
        if (deads.count(s))  
          continue;  
  
        deads.insert(s);  
  
        for (int i = 0; i < 4; i++) {  
          char c = s[i];  
          std::string s1 = s, s2 = s;  
          s1.insert(0, 1, (char)(c == '9' ? 0 : c - '0' + 1));  
          s2.insert(0, 1, (char)(c == '0' ? 9 : c - '0' - 1));  
          if (!deads.count(s1))  
            tmp.insert(s1);  
  
          if (!deads.count(s2))  
            tmp.insert(s2);  
        }  
      }  
  
      level++;  
      begin = end;  
      end = std::move(tmp);  
    }  
  
    return -1;  
  }  
};
```