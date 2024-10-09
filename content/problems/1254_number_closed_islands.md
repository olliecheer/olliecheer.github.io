---
tags:
  - island
  - dfs
---

![[problems/pictures/Pasted image 20240910010454.png]]
![[problems/pictures/Pasted image 20240910010503.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  bool dfs(int x, int y, int m, int n, vec<vec<int>> &grid,
           vec<vec<bool>> &visit) {
    if (x < 0 || x >= m || y < 0 || y >= n)
      return false;

    if (grid[x][y] == 1 || visit[x][y])
      return true;

    visit[x][y] = true;
    bool isClosed = true;
    vec<int> dirx{0, 1, 0, -1};
    vec<int> diry{-1, 0, 1, 0};

    for (int i = 0; i < 4; i++) {
      int r = x + dirx[i];
      int c = y + diry[i];
      if (!dfs(r, c, m, n, grid, visit))
        isClosed = false;
    }

    return isClosed;
  }

public:
  int closedIsland(vec<vec<int>> &grid) {
    int m = grid.size();
    int n = grid[0].size();
    int count = 0;
    vec<vec<bool>> visit(m, vec<bool>(n));
    for (int i = 0; i < m; i++)
      for (int j = 0; j < n; j++)
        if (grid[i][j] == 0 && !visit[i][j] && dfs(i, j, m, n, grid, visit))
          count++;

    return count;
  }
};
```