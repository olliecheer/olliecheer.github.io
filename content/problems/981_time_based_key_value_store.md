---
tags:
---
![[pictures/Pasted image 20241013202210.png]]
![[pictures/Pasted image 20241013202220.png]]


```c++
template <typename T> using vec = std::vector<T>;

class TimeMap {
  std::unordered_map<std::string, std::map<int, std::string>> mp;

public:
  void set(std::string key, std::string value, int timestamp) {
    mp[key][timestamp] = value;
  }

  std::string get(std::string key, int timestamp) {
    auto it = mp.find(key);
    if (it == mp.end())
      return "";

    auto t = it->second.upper_bound(timestamp);
    if (t != it->second.begin()) {
      t--;
      return t->second;
    }

    return "";
  }
};
```