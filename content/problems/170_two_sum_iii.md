---
tags:
  - sum
---
![[pictures/Pasted image 20241013235219.png]]
![[pictures/Pasted image 20241013235226.png]]



```c++
template <typename T> using vec = std::vector<T>;

class TwoSum {
  std::unordered_map<int, int> mp;

public:
  void add(int number) { mp[number]++; }

  bool find(int value) {
    if (mp.empty())
      return false;

    for (auto &&it : mp) {
      int k = it.first;
      int v = it.second;
      long diff = (long)value - (long)k;

      if (diff != k && mp.count(diff))
        return true;

      if (diff == k && mp[k] > 1)
        return true;
    }

    return false;
  }
};
```