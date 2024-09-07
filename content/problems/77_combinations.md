---
tags:
  - combination
  - dfs
---
![[problems/pictures/Pasted image 20240907234544.png]]

```c++
class Solution {  
  void dfs(vec<vec<int>> &res, vec<int> &level, int n, int k, int idx) {  
    if (level.size() == k)  
      res.push_back(level);  
    else {  
      for (int i = idx; i <= n; i++) {  
        level.push_back(i);  
        dfs(res, level, n, k, i + 1);  
        level.pop_back();  
      }  
    }  
  }  
  
public:  
  vec<vec<int>> combine(int n, int k) {  
    vec<vec<int>> res;  
    vec<int> level;  
    dfs(res, level, n, k, 1);  
    return res;  
  }  
};
```
