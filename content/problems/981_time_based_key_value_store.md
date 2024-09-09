---
tags:
---
![[problems/pictures/Pasted image 20240910003120.png]]
![[problems/pictures/Pasted image 20240910003127.png]]

```c++
class TimeMap {  
  std::unordered_map<std::string, std::map<int, std::string>> mp;  
  
public:  
  TimeMap() {}  
  
  void set(std::string key, std::string value, int timestamp) {  
    mp[key][timestamp] = value;  
  }  
  
  std::string get(std::string key, int timestamp) {  
    auto it = mp.find(key);  
    if (it == mp.end()) {  
      return "";  
    }  
  
    auto t = it->second.upper_bound(timestamp);  
    if (t != it->second.begin()) {  
      t--;  
      return t->second;  
    }  
  
    return "";  
  }  
};
```