---
tags:
  - island
---
![[problems/pictures/Pasted image 20240909232536.png]]

```c++
class Solution {  
  vec<vec<int>> grid;  
  vec<vec<bool>> visited;  
  vec<int> shape;  
  int M, N;  
  
  void explore(int r, int c) {  
    if (r < 0 || r >= M || c < 0 || c >= N)  
      return;  
  
    if (grid[r][c] != 1 || visited[r][c])  
      return;  
  
      visited[r][c] = true;  
    shape.push_back(r * N + c);  
    explore(r + 1, c);  
    explore(r - 1, c);  
    explore(r, c + 1);  
    explore(r, c - 1);  
  }  
  
  vec<int> canonical(vec<int> shape) {  
    vec<int> res;  
    vec<int> out(shape.size()), xs(shape.size()), ys(shape.size());  
  
    for (int c = 0; c < 8; c++) {  
      int t = 0;  
      for (int z : shape) {  
        int x = z / N;  
        int y = z % N;  
  
        switch (c) {  
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
  int numDistinctIslands(vec<vec<int>> grid_) {  
    this->grid = std::move(grid_);  
    M = grid.size();  
    N = grid[0].size();  
      visited = vec<vec<bool>>(M, vec<bool>(N));  
  
    std::set<vec<int>> shapes;  
  
    for (int r = 0; r < M; r++) {  
      for (int c = 0; c < N; c++) {  
        shape = {};  
        explore(r, c);  
        if (!shape.empty())  
          shapes.insert(canonical(std::move(shape)));  
      }  
    }  
  
    return shapes.size();  
  }  
};
```