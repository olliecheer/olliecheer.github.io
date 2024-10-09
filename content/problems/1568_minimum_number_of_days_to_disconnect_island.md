---
tags:
  - tarjan
  - island
---
![[problems/pictures/Pasted image 20240910014631.png]]
![[problems/pictures/Pasted image 20240910014642.png]]

### failed

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  std::unordered_map<int, std::unordered_set<int>> graph;
  std::unordered_map<int, int> time_map;
  bool found_critical_edge;
  vec<vec<int>> dirs = {
      {-1, 0},
      {1, 0},
      {0, -1},
      {0, 1},
  };
  int root = -1, time = 0, count = 0;

  void dfs(vec<vec<bool>> &visited, vec<vec<int>> &grid, int i, int j) {
    if (i < 0 || j < 0 || i >= grid.size() || j >= grid[0].size() ||
        visited[i][j] || grid[i][j] == 0)
      return;

    count++;
    visited[i][j] = true;
    for (auto &dir : dirs)
      dfs(visited, grid, i + dir[0], j + dir[1]);
  }

  int numOfIsland(vec<vec<int>> &grid) {
    int res = 0;
    vec<vec<bool>> visited(grid.size(), vec<bool>(grid[0].size()));

    for (int i = 0; i < grid.size(); i++)
      for (int j = 0; j < grid[0].size(); j++)
        if (!visited[i][j] && grid[i][j] == 1) {
          if (root == -1)
            root = j * grid[0].size() + j;

          res++;
          dfs(visited, grid, i, j);
        }

    return res;
  }

  void mark(vec<vec<int>> &grid, int prev_x, int prev_y, int x, int y) {
    if (x < 0 || y < 0 || x >= grid.size() || y >= grid[0].size() ||
        grid[x][y] == 0)
      return;

    int n1 = prev_x * grid[0].size() + prev_y;
    int n2 = x * grid[0].size() + y;
    // graph[n1].push_back(n2);
    // graph[n2].push_back(n1);
    graph[n1].insert(n2);
    graph[n2].insert(n1);

  }

  void buildGraph(vec<vec<int>> &grid) {
    for (int i = 0; i < grid.size(); i++)
      for (int j = 0; j < grid[0].size(); j++)
        if (grid[i][j] == 1)
          for (auto &dir : dirs)
            mark(grid, i, j, i + dir[0], j + dir[1]);
  }

  void tarjin(int parent, int cur, int time, std::unordered_set<int> &visited) {
    visited.insert(cur);
    time_map[cur] = time;
    for (int it : graph[cur]) {
      if (it == parent)
        continue;

      if (!visited.count(it))
        tarjin(cur, it, time + 1, visited);

      if (time < time_map[it])
        found_critical_edge = true;

      time_map[cur] = std::min(time_map[cur], time_map[it]);
    }
  }

public:
  int minDays(vec<vec<int>> &grid) {
    if (numOfIsland(grid) != 1)
      return 0;

    if (count == 1)
      return 1;

    if (count == 2)
      return 2;

    buildGraph(grid);

    std::unordered_set<int> visited;
    tarjin(-1, root, 0, visited);

    return found_critical_edge ? 1 : 2;
  }
};
```