---
tags:
  - island
---
![[problems/pictures/Pasted image 20240909232536.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<int>> grid;
  int M, N;

  void explore(int r, int c, vec<int> &shape) {
    if (r < 0 || r >= M || c < 0 || c >= N)
      return;

    if (grid[r][c] != 1)
      return;

    grid[r][c] = 0;
    shape.push_back(r * N + c);
    explore(r + 1, c, shape);
    explore(r - 1, c, shape);
    explore(r, c + 1, shape);
    explore(r, c - 1, shape);
  }

  vec<int> canonical(vec<int> shape) {
    vec<int> res;
    vec<int> out(shape.size()), xs(shape.size()), ys(shape.size());

    for (int i = 0; i < 8; i++) {
      int t = 0;
      for (int z : shape) {
        int x = z / N;
        int y = z % N;

        switch (i) {
        case 0:
          xs[t] = x;
          ys[t] = y;
          break;
        case 1:
          xs[t] = x;
          ys[t] = -y;
          break;
        case 2:
          xs[t] = -x;
          ys[t] = y;
          break;
        case 3:
          xs[t] = -x;
          ys[t] = -y;
          break;
        case 4:
          xs[t] = y;
          ys[t] = x;
          break;
        case 5: {
          xs[t] = y;
          ys[t] = -x;
          break;
        }
        case 6: {
          xs[t] = -y;
          ys[t] = x;
          break;
        }
        case 7: {
          xs[t] = -y;
          ys[t] = -x;
          break;
        }
        }

        t++;
      }

      int min_x = *std::min_element(xs.begin(), xs.end());
      int min_y = *std::min_element(ys.begin(), ys.end());

      for (int i = 0; i < shape.size(); i++)
        out[i] = (xs[i] - min_x) * N + (ys[i] - min_y);

      std::sort(out.begin(), out.end());

      if (res < out)
        res = out;
    }

    return res;
  }

public:
  int numDistinctIslands2(vec<vec<int>> _grid) {
    grid = std::move(_grid);
    M = grid.size();
    N = grid[0].size();

    std::set<vec<int>> shapes;

    for (int r = 0; r < M; r++) {
      for (int c = 0; c < N; c++) {
        vec<int> shape = {};
        explore(r, c, shape);
        if (!shape.empty())
          shapes.insert(canonical(std::move(shape)));
      }
    }

    return shapes.size();
  }
};
```
