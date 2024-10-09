---
tags:
  - path
---
![[problems/pictures/Pasted image 20240910015153.png]]
![[problems/pictures/Pasted image 20240910015207.png]]
![[problems/pictures/Pasted image 20240910015216.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
private:
  static constexpr int dirs[4][2] = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};

public:
  int minimumEffortPath(vec<vec<int>> &heights) {
    int m = heights.size();
    int n = heights[0].size();

    auto tupleCmp = [](const auto &e1, const auto &e2) {
      auto &&[x1, y1, d1] = e1;
      auto &&[x2, y2, d2] = e2;
      return d1 > d2;
    };
    std::priority_queue<tuple<int, int, int>, vec<std::tuple<int, int, int>>,
                        decltype(tupleCmp)>
        q(tupleCmp);
    q.emplace(0, 0, 0);

    vec<int> dist(m * n, INT_MAX);
    dist[0] = 0;
    vec<int> seen(m * n);

    while (!q.empty()) {
      auto [x, y, d] = q.top();
      q.pop();
      int id = x * n + y;
      if (seen[id])
        continue;

      if (x == m - 1 && y == n - 1)
        break;

      seen[id] = 1;
      for (int i = 0; i < 4; ++i) {
        int nx = x + dirs[i][0];
        int ny = y + dirs[i][1];
        if (nx >= 0 && nx < m && ny >= 0 && ny < n &&
            max(d, abs(heights[x][y] - heights[nx][ny])) < dist[nx * n + ny]) {
          dist[nx * n + ny] = max(d, abs(heights[x][y] - heights[nx][ny]));
          q.emplace(nx, ny, dist[nx * n + ny]);
        }
      }
    }

    return dist[m * n - 1];
  }
};
```