---
tags:
  - path
---
![[problems/pictures/Pasted image 20240910015153.png]]
![[problems/pictures/Pasted image 20240910015207.png]]
![[problems/pictures/Pasted image 20240910015216.png]]


```c++
class Solution {  
  vec<vec<int>> dirs = {  
      {0, 1},  
      {0, -1},  
      {1, 0},  
      {-1, 0},  
  };  
  
  struct Cell {  
    int x;  
    int y;  
    int diff;  
  
    explicit Cell(int x_, int y_, int diff_) : x{x_}, y{y_}, diff{diff_} {}  
  };  
  
  bool isValidCell(int x, int y, int row, int col) {  
    return x >= 0 && x <= row - 1 && y >= 0 && y < col - 1;  
  }  
  
public:  
  int minimumEffortPath(vec<vec<int>> &heights) {  
    int row = heights.size(), col = heights[0].size();  
    vec<vec<int>> diff_matrix(row,  
                              vec<int>(col, std::numeric_limits<int>::max()));  
    diff_matrix[0][0] = 0;  
    auto pq_comp = [](Cell &a, Cell &b) { return a.diff > b.diff; };  
  
    std::priority_queue<Cell, vec<Cell>, decltype(pq_comp)> pq(pq_comp);  
    pq.emplace(0, 0, diff_matrix[0][0]);  
  
    vec<vec<bool>> visited(row, vec<bool>(col));  
  
    while (!pq.empty()) {  
      auto cur = pq.top();  
      pq.pop();  
  
      visited[cur.x][cur.y] = true;  
      if (cur.x == row - 1 && cur.y == col - 1)  
        return cur.diff;  
  
      for (auto &&dir : dirs) {  
        int X = cur.x + dir[0], Y = cur.y + dir[1];  
        if (isValidCell(X, Y, row, col) && !visited[X][Y]) {  
          int cur_diff = std::abs(heights[X][Y] - heights[cur.x][cur.y]);  
          int max_diff = std::max(cur_diff, diff_matrix[cur.x][cur.y]);  
  
          if (diff_matrix[X][Y] > max_diff) {  
            diff_matrix[X][Y] = max_diff;  
            pq.emplace(X, Y, max_diff);  
          }  
        }  
      }  
    }  
  
    return diff_matrix[row - 1][col - 1];  
  }  
};
```