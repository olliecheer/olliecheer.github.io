---
tags:
  - island
  - union_find
---
![[problems/pictures/Pasted image 20240910001610.png]]

```c++
class Solution {  
  class DSU {  
  public:  
    vec<int> parent;  
    vec<int> size;  
  
    explicit DSU(int n) {  
      parent = vec<int>(n);  
      for (int i = 0; i < n; i++)  
        parent[i] = i;  
  
      size = vec<int>(n, 1);  
    }  
  
    int find(int x) {  
      if (parent[x] != x)  
        parent[x] = find(parent[x]);  
  
      return parent[x];  
    }  
  
    void union_(int x, int y) {  
      int root_x = find(x), root_y = find(y);  
      if (root_x == root_y)  
        return;  
  
      if (size[root_x] < size[root_y]) {  
        parent[root_x] = root_y;  
        size[root_y] += size[root_x];  
      } else {  
        parent[root_y] = root_x;  
        size[root_x] += size[root_y];  
      }  
    }  
  };  
  
  vec<vec<int>> dirs = {  
      {0, 1},  
      {0, -1},  
      {1, 0},  
      {-1, 0},  
  };  
  
public:  
  int largestIsland(vec<vec<int>> &grid) {  
    int m = grid.size(), n = grid[0].size();  
    int res = 1;  
    DSU dsu(m * n);  
  
    for (int i = 0; i < m; i++) {  
      for (int j = 0; j < n; j++) {  
        if (grid[i][j] == 1) {  
          for (auto &&dir : dirs) {  
            int x = i + dir[0], y = j + dir[1];  
            if (x < 0 || y < 0 || x >= m || y >= n || grid[x][y] != 1)  
              continue;  
  
            dsu.union_(i * n + j, x * n + y);  
            res = std::max(res, dsu.size[dsu.find(i * n + j)]);  
          }  
        }  
      }  
    }  
  
    for (int i = 0; i < m; i++) {  
      for (int j = 0; j < n; j++) {  
        if (grid[i][j] == 0) {  
          std::unordered_map<int, int> mp;  
          for (auto &&dir : dirs) {  
            int x = i + dir[0], y = j + dir[1];  
            if (x < 0 || y < 0 || x >= m || y >= n || grid[x][y] != 1)  
              continue;  
  
            int parent = dsu.find(x * n + y);  
            mp.insert({parent, dsu.size[parent]});  
          }  
        }  
      }  
    }  
  
    return res;  
  }  
};
```