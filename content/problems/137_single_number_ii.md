---
tags:
  - bitwise
---
![[pictures/Pasted image 20241013234023.png]]



```c++
// space O(1)  
template <typename T> using vec = std::vector<T>;

class Solution {
  void saveIntoMap(int num, vec<int> &mp) {
    for (int i = 0; i < 32; i++)
      mp[i] += (num >> i) & 1;
  }

public:
  int singleNumber(vec<int> &nums) {
    int res = 0;
    vec<int> mp(32);
    for (int num : nums)
      saveIntoMap(num, mp);

    for (int i = 0; i < 32; i++)
      mp[i] = mp[i] % 3;

    for (int i = 0; i < 32; i++)
      res |= mp[i] << i;

    return res;
  }
};
```


```c++
// Space O(n)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int singleNumber(vec<int> &nums) {
    std::unordered_map<int, int> mp;
    for (int it : nums)
      mp[it]++;

    for (auto &&it : mp) {
      if (it.second == 1)
        return it.first;
    }

    return -1;
  }
};
```