---
tags:
---
![[problems/pictures/Pasted image 20240909220158.png]]

```c++
class Solution {  
  vec<int> lst;  
  std::unordered_map<int, int> mp;  
  
  int getRandom() { return lst[rand() % lst.size()]; }  
  
public:  
  bool insert(int val) {  
    if (mp.count(val))  
      return false;  
  
    mp[val] = lst.size();  
    lst.push_back(val);  
    return true;  
  }  
  
  bool remove(int val) {  
    if (!mp.count(val))  
      return false;  
  
    int i = mp[val];  
    if (i < lst.size() - 1) {  
      int last = lst.back();  
      lst[i] = last;  
      mp[last] = i;  
    }  
  
    mp.erase(val);  
    lst.pop_back();  
    return true;  
  }  
};
```