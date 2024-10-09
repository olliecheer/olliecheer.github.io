

// vip

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  void wallsAndGates(vec<vec<int>> &rooms) {
    int M = rooms.size(), N = rooms[0].size();
    vec<vec<int>> dirs = {
        {-1, 0},
        {0, 1},
        {0, -1},
        {1, 0},
    };

    std::queue<vec<int>> q;

    for (int i = 0; i < M; i++)
      for (int j = 0; j < N; j++)
        if (rooms[i][j] == 0)
          q.push({i, j});

    while (!q.empty()) {
      auto cur = q.front();
      q.pop();

      for (auto &dir : dirs) {
        int X = cur[0] + dir[0];
        int Y = cur[1] + dir[1];
        if (X < 0 || Y < 0 || X >= M || Y >= N || rooms[X][Y] != INT_MAX)
          continue;

        rooms[X][Y] = rooms[cur[0]][cur[1]] + 1;
        q.push({X, Y});
      }
    }
  }
};
```