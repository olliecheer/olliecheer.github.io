---
tags:
---
![[pictures/Pasted image 20241014005026.png]]
![[pictures/Pasted image 20241014005037.png]]
![[pictures/Pasted image 20241014005045.png]]



```c++
template <typename T> using vec = std::vector<T>;

class RandomizedCollection {
  vec<int> lst; // val
  std::unordered_map<int, std::unordered_set<int>>
      index_map; // {val : [idx,...]}

public:
  bool insert(int val) {
    index_map[val].insert(lst.size());
    lst.push_back(val);
    return index_map[val].size() == 1;
  }

  bool remove(int val) {
    if (!index_map.count(val) || index_map[val].empty())
      return false;

    int idx = *index_map[val].begin();
    int last = lst.back();

    index_map[val].erase(idx);

    index_map[last].insert(idx);
    index_map[last].erase(lst.size() - 1);

    lst[idx] = last;
    lst.pop_back();

    return true;
  }

  int getRandom() { return lst[rand() % lst.size()]; }
};
```