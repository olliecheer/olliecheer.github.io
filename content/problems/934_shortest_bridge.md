---
tags:
  - graph
  - matrix
---
![[pictures/Pasted image 20241013201621.png]]
![[pictures/Pasted image 20241013201635.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<int>> dirs = {
      {0, 1},
      {0, -1},
      {-1, 0},
      {1, 0},
  };
  std::queue<vec<int>> q;

  void dfs(vec<vec<int>> &grid, vec<vec<bool>> &visited, int i, int j) {
    if (i < 0 || j < 0 || i >= grid.size() || j >= grid[0].size() ||
        visited[i][j] || grid[i][j] == 0)
      return;

    visited[i][j] = true;
    q.push({i, j});

    for (auto &dir : dirs)
      dfs(grid, visited, i + dir[0], j + dir[1]);
  }

public:
  int shortestBridge(vec<vec<int>> &grid) {
    int m = grid.size(), n = grid[0].size();

    vec<vec<bool>> visited(m, vec<bool>(n));
    bool found = false;

    for (int i = 0; i < m; i++)
      for (int j = 0; j < n; j++)
        if (!found && grid[i][j] == 1) {
          dfs(grid, visited, i, j);
          found = true;
          break;
        }

    int step = 0;

    while (!q.empty()) {
      int sz = q.size();
      for (int x = 0; x < sz; x++) {
        auto cur = q.front();
        q.pop();

        for (auto &dir : dirs) {
          int i = cur[0] + dir[0], j = cur[1] + dir[1];
          if (i < 0 || j < 0 || i >= grid.size() || j >= grid[0].size() ||
              visited[i][j])
            continue;

          if (grid[i][j] == 1)
            return step;

          q.push({i, j});
          visited[i][j] = true;
        }
      }
      step++;
    }

    return -1;
  }
};
```