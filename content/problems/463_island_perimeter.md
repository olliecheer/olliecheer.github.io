---
tags:
  - island
---
![[pictures/Pasted image 20241014010735.png]]
![[pictures/Pasted image 20241014010748.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int dfs(vec<vec<int>> &grid, int i, int j) {
    if (i < 0 || i >= grid.size() || j < 0 || j >= grid[0].size() ||
        grid[i][j] == 0)
      return 1;

    if (grid[i][j] == -1)
      return 0;

    grid[i][j] = -1;
    return dfs(grid, i + 1, j) + dfs(grid, i - 1, j) + dfs(grid, i, j + 1) +
           dfs(grid, i, j - 1);
  }

public:
  int islandPerimeter(vec<vec<int>> &grid) {
    for (int i = 0; i < grid.size(); i++)
      for (int j = 0; j < grid[0].size(); j++)
        if (grid[i][j] == 1)
          return dfs(grid, i, j);

    return 0;
  }
};
```
