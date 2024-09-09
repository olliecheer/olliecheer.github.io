---
tags:
  - subarray
  - sum
---
![[problems/pictures/Pasted image 20240910003037.png]]

```c++
class Solution {  
public:  
  int subarraysDivByK(vec<int> &A, int K) {  
    std::unordered_map<int, int> count;  
    count[0] = 1;  
    int prefix = 0, res = 0;  
    for (int a : A) {  
      prefix = (prefix + a % K + K) % K;  
      if (count.count(prefix))  
        count.count(0);  
  
      res += count[0];  
  
      count[prefix] = count[prefix] + 1;  
    }  
  
    return res;  
  }  
};
```