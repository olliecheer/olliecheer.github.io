---
tags:
  - matrix
  - bfs
  - dfs
  - union_find
---


![[problems/pictures/Pasted image 20240908184632.png]]

```c++
class Solution {  
  vec<std::pair<int, int>> dirs = {  
      {0, 1},  
      {1, 0},  
      {0, -1},  
      {-1, 0},  
  };  
  
  void bfs(vec<vec<char>> grid, int row, int col) {  
    std::queue<std::pair<int, int>> q;  
    q.push({row, col});  
  
    while (!q.empty()) {  
      auto cur = q.front();  
      q.pop();  
      int x = cur.first, y = cur.second;  
      if (x < 0 || x >= grid.size() || y < 0 || y >= grid[0].size() ||  
          grid[x][y] == '0') {  
        continue;  
      }  
      grid[x][y] = '0';  
      for (auto dir : dirs) {  
        q.push({x + dir.first, y + dir.second});  
      }  
    }  
  }  
  
public:  
  int numIslands(vec<vec<char>> &grid) {  
    int M = grid.size(), N = grid[0].size();  
    int res = 0;  
    for (int i = 0; i < M; i++) {  
      for (int j = 0; j < N; j++) {  
        if (grid[i][j] == '1') {  
          res++;  
          bfs(grid, i, j);  
        }  
      }  
    }  
  
    return res;  
  }  
};
```


```c++
class Solution_DFS {  
  void dfs(vec<vec<char>> grid, int row, int col) {  
    if (row < 0 || row >= grid.size() || col < 0 || col >= grid[0].size() ||  
        grid[row][col] == '0') {  
      return;  
    }  
  
    grid[row][col] = '0';  
    dfs(grid, row - 1, col);  
    dfs(grid, row + 1, col);  
    dfs(grid, row, col - 1);  
    dfs(grid, row, col + 1);  
  }  
  
public:  
  int numIslands(vec<vec<char>> &grid) {  
    int M = grid.size(), N = grid[0].size();  
    int res = 0;  
    for (int i = 0; i < M; i++) {  
      for (int j = 0; j < N; j++) {  
        if (grid[i][j] == '1') {  
          res++;  
          dfs(grid, i, j);  
        }  
      }  
    }  
  
    return res;  
  }  
};
```


```c++
class Solution_UF {  
  class DSU {  
    vec<int> parent;  
  
  public:  
    explicit DSU(int N) {  
      parent = vec<int>(N);  
      for (int i = 0; i < N; i++)  
        parent[i] = i;  
    }  
  
    int find(int x) {  
      if (parent[x] != x)  
        parent[x] = find(parent[x]);  
  
      return parent[x];  
    }  
  
    void union_(int x, int y) { parent[find(x)] = find(y); }  
  };  
  
  template <typename T> using vec = vec<T>;  
  
  vec<vec<int>> dirs = {  
      {0, 1},  
      {0, -1},  
      {1, 0},  
      {-1, 0},  
  };  
  
public:  
  int numIslands(vec<vec<char>> &grid) {  
    int M = grid.size(), N = grid[0].size();  
    int count = 0;  
    DSU dsu(M * N);  
    for (int i = 0; i < M; i++) {  
      for (int j = 0; j < N; j++) {  
        if (grid[i][j] == '1') {  
          count++;  
          for (auto &dir : dirs) {  
            int x = i + dir[0], y = j + dir[1];  
            if (x >= 0 && y >= 0 && x < M && y < N && grid[x][y] == '1') {  
              if (dsu.find(x * N + y) != dsu.find(i * N + j))  
                count--;  
  
              dsu.union_(x * N + y, i * N + j);  
            }  
          }  
        }  
      }  
    }  
  
    return count;  
  }  
};
```