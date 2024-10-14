---
tags:
  - matrix
  - bfs
  - memo
---
![[problems/pictures/Pasted image 20241010215935.png]]
![[problems/pictures/Pasted image 20241010215948.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<int>> dirs = {
      {-1, 0},
      {1, 0},
      {0, -1},
      {0, 1},
  };

public:
  vec<vec<int>> updateMatrix(vec<vec<int>> matrix) {
    int M = matrix.size(), N = matrix[0].size();
    std::queue<vec<int>> q;

    for (int i = 0; i < M; i++)
      for (int j = 0; j < N; j++) {
        if (matrix[i][j] == 0)
          q.push({i, j});
        else
          matrix[i][j] = INT_MAX;
      }

    while (!q.empty()) {
      auto cur = q.front();
      q.pop();

      for (auto &dir : dirs) {
        int r = cur[0] + dir[0], c = cur[1] + dir[1];
        if (r < 0 || r >= M || c < 0 || c >= N || matrix[r][c] != INT_MAX)
          continue;

        q.push({r, c});
        matrix[r][c] = matrix[cur[0]][cur[1]] + 1;
      }
    }

    return matrix;
  }
};
```
