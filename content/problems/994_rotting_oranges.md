---
tags:
  - matrix
---
![[problems/pictures/Pasted image 20241013202759.png]]
![[problems/pictures/Pasted image 20241013202807.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int orangesRotting(vec<vec<int>> &grid) {
    vec<std::pair<int, int>> dirs = {
        {0, 1},
        {0, -1},
        {1, 0},
        {-1, 0},
    };
    std::queue<std::pair<int, int>> q;
    int time = -1, fresh = 0;
    int M = grid.size(), N = grid[0].size();
    for (int i = 0; i < M; i++)
      for (int j = 0; j < N; j++)
        if (grid[i][j] == 2)
          q.push({i, j});
        else if (grid[i][j] == 1)
          fresh++;

    if (fresh == 0)
      return 0;

    if (q.empty())
      return -1;

    while (!q.empty()) {
      time++;
      int sz = q.size();
      for (int i = 0; i < sz; i++) {
        auto cur = q.front();
        q.pop();
        for (auto dir : dirs) {
          int x = cur.first + dir.first, y = cur.second + dir.second;
          if (x < 0 || x >= M || y < 0 || y >= N)
            continue;

          if (grid[x][y] == 1) {
            q.push({x, y});
            grid[x][y] = 2;
            fresh--;
          }
        }
      }
    }

    return fresh ? -1 : time;
  }
};
```