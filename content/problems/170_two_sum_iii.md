---
tags:
  - sum
---

![[problems/pictures/Pasted image 20240908184059.png]]


```c++
class Solution {  
  std::unordered_map<int, int> mp;  
  
public:  
  void add(int number) { mp.insert({number, mp[number]}); }  
  
  bool find(int value) {  
    if (mp.empty())  
      return false;  
  
    for (auto &&it : mp) {  
      int k = it.first;  
      int v = it.second;  
      int diff = value - k;  
      if (diff != k && mp.count(diff))  
        return true;  
  
      if (diff == k && mp[k] > 1)  
        return true;  
    }  
  
    return false;  
  }  
};
```