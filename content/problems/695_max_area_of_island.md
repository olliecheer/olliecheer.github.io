---
tags:
  - island
  - matrix
---
![[problems/pictures/Pasted image 20240909232127.png]]
![[problems/pictures/Pasted image 20240909232141.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void dfs(vec<vec<int>> &grid, int x, int y, int &area) {
    if (x >= 0 && x < grid.size() && y >= 0 && y < grid[0].size() &&
        grid[x][y] == 1) {
      grid[x][y] = 0;
      area++;
      dfs(grid, x - 1, y, area);
      dfs(grid, x + 1, y, area);
      dfs(grid, x, y - 1, area);
      dfs(grid, x, y + 1, area);
    }
  }

public:
  int maxAreaOfIsland(vec<vec<int>> &grid) {
    int res = 0;
    int area;

    for (int i = 0; i < grid.size(); i++) {
      for (int j = 0; j < grid[0].size(); j++) {
        if (grid[i][j] == 1) {
          area = 0;
          dfs(grid, i, j, area);
          res = std::max(area, res);
        }
      }
    }

    return res;
  }
};
```
