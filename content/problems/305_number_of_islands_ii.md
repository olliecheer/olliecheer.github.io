---
tags:
  - island
  - matrix
  - union_find
---



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  class DSU {
    vec<int> parent;
    vec<int> rank;

  public:
    explicit DSU(int N) {
      parent = vec<int>(N);
      rank = vec<int>(N, 1);
      for (int i = 0; i < N; i++)
        parent[i] = i;
    }

    int find(int x) {
      if (parent[x] != x)
        parent[x] = find(parent[x]);

      return parent[x];
    }

    void union_(int x, int y) {
      int root_x = find(x), root_y = find(y);
      if (root_x == root_y)
        return;

      if (rank[root_x] < rank[root_y])
        parent[root_x] = root_y;
      else if (rank[root_x] > rank[root_y])
        parent[root_y] = root_x;
      else {
        parent[root_x] = root_y;
        rank[root_y]++;
      }
    }
  };

  vec<vec<int>> dirs = {
      {0, 1},
      {0, -1},
      {1, 0},
      {-1, 0},
  };

public:
  vec<int> numIslands2(int m, int n, vec<vec<int>> &positions) {
    DSU dsu(m * n);
    vec<vec<bool>> island(m, vec<bool>(n));
    vec<int> res;
    int count = 0;

    for (auto &cur : positions) {
      if (island[cur[0]][cur[1]]) {
        res.push_back(count);
        continue;
      }

      island[cur[0]][cur[1]] = true;
      count++;

      for (auto &&dir : dirs) {
        int x = cur[0] + dir[0], y = cur[1] + dir[1];
        if (x < 0 || x >= m || y < 0 || y >= n || !island[x][y])
          continue;

        int i = dsu.find(cur[0] * n + cur[1]);
        int j = dsu.find(x * n + y);
        if (i != j) {
          dsu.union_(i, j);
          count--;
        }
      }

      res.push_back(count);
    }

    return res;
  }
};
```