---
tags:
---
![[problems/pictures/Pasted image 20240909223140.png]]

```c++
class LFUCache {  
  std::unordered_map<int, int> mp;                        // <key, value>  
  std::unordered_map<int, int> freq_mp;                   // <key, freq>  
  std::unordered_map<int, std::unordered_set<int>> lists; // <freq, set<key>>  
  
  int capacity;  
  int min;  
  
public:  
  LFUCache(int capacity) : capacity{capacity} { lists.insert({1, {}}); }  
  
  int get(int key) {  
    if (!mp.count(key))  
      return -1;  
  
    int freq = freq_mp[key];  
    lists[freq].erase(key);  
  
    if (freq_mp[key] == min && lists[min].size() == 0)  
      min++;  
  
    freq_mp[key]++;  
  
    freq = freq_mp[key];  
    lists[freq].insert(key);  
    return mp[key];  
  }  
  
  void put(int key, int value) {  
    if (capacity == 0)  
      return;  
  
    if (mp.count(key)) {  
      mp.insert({key, value});  
      get(key);  
    } else {  
      if (mp.size() == capacity) {  
        int tmp = *lists[min].begin();  
        lists[min].erase(tmp);  
        mp.erase(tmp);  
      }  
      mp.insert({key, value});  
      freq_mp.insert({key, 1});  
      min = 1;  
      lists[min].insert(key);  
    }  
  }  
};
```