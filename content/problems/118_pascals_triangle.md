---
tags:
  - pascals_triangle
---



![[problems/pictures/Pasted image 20240908025724.png]]

```c++
class Solution {  
public:  
  vec<vec<int>> generate(int numRows) {  
    vec<vec<int>> res;  
    if (numRows > 0)  
      res.push_back({1});  
  
    for (int i = 1; i < numRows; i++) {  
      vec<int> lst;  
      lst.push_back(1);  
      for (int j = 1; j < i; j++)  
        lst.push_back(res[i - 1][j - 1] + res[i - 1][j]);  
      lst.push_back(1);  
      res.push_back(std::move(lst));  
    }  
  
    return res;  
  }  
};
```