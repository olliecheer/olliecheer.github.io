---
tags:
  - array
---
![[problems/pictures/Pasted image 20240909224819.png]]

```c++
// O(N)  
class Solution {  
public:  
  int findMaxLength(vec<int> &nums) {  
    for (int &it : nums)  
      if (it == 0)  
        it = -1;  
  
    int res = 0, sum = 0;  
  
    std::unordered_map<int, int> mp;  
    mp[0] = -1;  
  
    for (int i = 0; i < nums.size(); i++) {  
      sum += nums[i];  
      if (mp.count(sum))  
        res = std::max(res, i - mp[sum]);  
      else  
        mp[sum] = i;  
    }  
  
    return res;  
  }  
};
```