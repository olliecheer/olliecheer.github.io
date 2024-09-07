---
tags:
  - bitwise
---
![[problems/pictures/Pasted image 20240908031632.png]]

```c++
// space O(1)  
class Solution_bitmask {  
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
class Solution_hashmap {  
public:  
  int singleNumber(vec<int> &nums) {  
    std::unordered_map<int, int> mp;  
    for (int it : nums)  
      mp[it]++;  
  
    for (auto &&it : mp) {  
      if (mp[it.first] == 1)  
        return it.first;  
    }  
  
    return -1;  
  }  
};
```