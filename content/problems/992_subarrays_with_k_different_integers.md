---
tags:
  - subarray
---
![[problems/pictures/Pasted image 20240910003249.png]]

```c++
class Solution {  
  int atMost(vec<int> &A, int K) {  
    int left = 0, res = 0;  
    std::unordered_map<int, int> mp;  
    for (int i = 0; i < A.size(); i++) {  
      if (mp[A[i]] == 0)  
        K--;  
      mp.insert({A[i], mp[A[i]] + 1});  
      while (K < 0) {  
        mp.insert({A[left], mp[A[left]] - 1});  
        if (mp[A[left]] == 0)  
          K++;  
        left++;  
      }  
      res = i - left + 1;  
    }  
    return res;  
  }  
  
public:  
  int subarraysWithKDistinct(vec<int> &A, int K) {  
    return atMost(A, K) - atMost(A, K - 1);  
  }  
};
```