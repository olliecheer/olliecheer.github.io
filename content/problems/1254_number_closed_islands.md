---
tags:
  - island
  - dfs
---

![[problems/pictures/Pasted image 20240910010454.png]]
![[problems/pictures/Pasted image 20240910010503.png]]


```c++
class Solution {  
  enum {  
    WATER = 1,  
    LAND = 0,  
  };  
  
  bool dfs(vec<vec<int>> &grid, int i, int j, int m, int n) {  
    if (i < 0 || j < 0 || i >= m || j >= n)  
      return false;  
  
    if (grid[i][j] == 1)  
      return true;  
  
    grid[i][j] = 1;  
  
    return dfs(grid, i - 1, j, m, n) && dfs(grid, i, j - 1, m, n) &&  
           dfs(grid, i + 1, j, m, n) && dfs(grid, i, j + 1, m, n);  
  }  
  
public:  
  int closedIsland(vec<vec<int>> &grid) {  
    int res = 0;  
    int m = grid.size(), n = grid[0].size();  
    for (int i = 0; i < m; i++) {  
      for (int j = 0; j < n; j++) {  
        if (grid[i][j] == 0 && dfs(grid, i, j, m, n))  
          res++;  
      }  
    }  
    return res;  
  }  
};
```