---
tags:
  - array
  - majority_number
---




```c++
class Solution {  
public:  
  int majorityNumber(vec<int> &nums, int k) {  
    std::unordered_map<int, int> mp;  
    for (int i : nums) {  
      if (mp.count(i))  
        mp[i]++;  
      else if (mp.size() < k - 1)  
        mp[i] = 1;  
      else {  
        vec<int> lst;  
  
        for (auto &&it : mp) {  
          int key = it.first;  
          int val = it.second;  
  
          if (mp[key] == 1)  
            lst.push_back(key);  
          else  
            mp[key]--;  
        }  
  
        for (int j : lst)  
          mp.erase(j);  
      }  
    }  
  
    for (auto &&it : mp)  
      mp[it.first] = 0;  
  
    for (int i : nums) {  
      if (mp.count(i)) {  
        if (mp[i] + 1 > (nums.size() / k))  
          return i;  
  
        mp[i]++;  
      }  
    }  
  
    return 0;  
  }  
};
```