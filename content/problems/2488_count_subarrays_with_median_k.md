---
tags:
  - subarray
---

![[problems/pictures/Pasted image 20240910023010.png]]


```c++
class Solution {  
public:  
  int countSubarrays(vec<int> &nums, int k) {  
    std::map<int, int> cnt;  
    cnt.insert({0, 1});  
    int res = 0, balance = 0;  
    bool found = false;  
  
    for (int num : nums) {  
      if (num < k) {  
        balance--;  
      } else if (num > k) {  
        balance++;  
      } else {  
        found = true;  
      }  
  
      if (found) {  
        res += cnt[0] + cnt[balance - 1];  
      } else {  
        cnt.insert({balance, cnt[0] + 1});  
      }  
    }  
    return res;  
  }  
};
```