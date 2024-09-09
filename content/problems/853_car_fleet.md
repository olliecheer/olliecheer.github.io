---
tags:
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240910001657.png]]

```c++
class Solution {  
public:  
  int carFleet(int target, vec<int> position, vec<int> speed) {  
    std::unordered_map<int, double> mp;  
    for (int i = 0; i < position.size(); i++)  
      mp[-position[i]] = ((double)(target - position[i])) / speed[i];  
  
    int res = 0;  
    double prev = -1;  
    for (auto &&it : mp) {  
      double t = it.second;  
      if (t > prev) {  
        prev = t;  
        res++;  
      }  
    }  
  
    return res;  
  }  
};
```