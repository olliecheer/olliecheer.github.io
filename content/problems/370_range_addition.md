---
tags:
  - prefix_sum
---
![[problems/pictures/Pasted image 20240909215951.png]]


```c++
class Solution {  
public:  
  vec<int> getModifiedArray(int length, vec<vec<int>> &updates) {  
    vec<int> res(length);  
  
    for (auto &&it : updates) {  
      int value = it[2];  
      int start = it[0];  
      int end = it[1];  
  
      res[start] += value;  
  
      if (end < length - 1)  
        res[end + 1] -= value;  
    }  
  
    int sum = 0;  
    for (int i = 0; i < length; i++) {  
      sum += res[i];  
      res[i] = sum;  
    }  
  
    return res;  
  }  
};
```