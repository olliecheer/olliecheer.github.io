---
tags:
  - priority_queue
  - dijkstra
---

![[problems/pictures/Pasted image 20240910023550.png]]
![[problems/pictures/Pasted image 20240910023600.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<int>> dirs = {
      {1, 0},
      {-1, 0},
      {0, 1},
      {0, -1},
  };

public:
  int minimumTime(vec<vec<int>> &grid) {
    if (grid[0][1] > 1 && grid[1][0] > 1)
      return -1;

    int M = grid.size(), N = grid[0].size();

    vec<vec<int>> distTo(M, vec<int>(N, INT_MAX));
    distTo[0][0] = 0;

    const int ROW = 0, COL = 1, DIST = 2;
    auto pq_comp = [](vec<int> &a, vec<int> &b) { return a[DIST] > b[DIST]; };
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);
    pq.push({0, 0, 0});

    while (!pq.empty()) {
      auto cur = pq.top();
      pq.pop();
      for (auto &dir : dirs) {
        int r = cur[ROW] + dir[ROW], c = cur[COL] + dir[COL];
        if (r < 0 || r == M || c < 0 || c == N)
          continue;

        int distance = cur[DIST] + 1;

        if (distance < grid[r][c]) {
          if (distance % 2 == grid[r][c] % 2)
            distance = grid[r][c];
          else
            distance = grid[r][c] + 1;
        }

        if (distTo[r][c] > distance) {
          if (r == M - 1 && c == N - 1)
            return distance;

          distTo[r][c] = distance;
          pq.push({r, c, distance});
        }
      }
    }

    return -1;
  }
};
```
