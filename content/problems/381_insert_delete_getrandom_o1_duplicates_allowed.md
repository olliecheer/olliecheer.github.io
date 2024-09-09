---
tags:
---
![[problems/pictures/Pasted image 20240909220253.png]]
![[problems/pictures/Pasted image 20240909220300.png]]

```c++
class RandomizedCollection {  
  vec<int> lst;  
  std::unordered_map<int, std::unordered_set<int>> index_map;  
  
public:  
  bool insert(int val) {  
    index_map[val].insert(lst.size());  
    lst.push_back(val);  
    return index_map[val].size() == 1;  
  }  
  
  bool remove(int val) {  
    if (!index_map.count(val) || index_map[val].empty())  
      return false;  
  
    auto remove_idx = index_map[val].begin();  
    int last = lst.back();  
  
    index_map[val].erase(remove_idx);  
    //        index_map[last].insert();  
  }  
};
```