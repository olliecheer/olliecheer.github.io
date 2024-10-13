---
tags:
  - random
---
![[pictures/Pasted image 20241014004949.png]]
![[pictures/Pasted image 20241014004959.png]]



```c++
template <typename T> using vec = std::vector<T>;

class RandomizedSet {
  vec<int> lst;                    // val
  std::unordered_map<int, int> mp; // {val : idx}

public:
  int getRandom() { return lst[rand() % lst.size()]; }

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

    int idx = mp[val];
    mp[lst.back()] = idx;
    std::swap(lst[idx], lst.back());

    mp.erase(val);
    lst.pop_back();
    return true;
  }
};
```