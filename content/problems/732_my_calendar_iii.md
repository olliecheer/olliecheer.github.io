---
tags:
  - calendar
---
![[problems/pictures/Pasted image 20240909233136.png]]

```c++
class Solution {  
  std::unordered_map<int, int> mp;  
  
public:  
  int book(int start, int end) {  
    mp.insert({start, mp[start] + 1});  
    mp.insert({end, mp[end] - 1});  
    int sum = 0, res = 0;  
    for (auto &&it : mp) {  
      int k = it.first;  
      int v = it.second;  
      sum += v;  
      res = std::max(res, sum);  
    }  
  
    return res;  
  }  
};
```