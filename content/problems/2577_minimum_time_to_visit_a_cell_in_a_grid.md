---
tags:
  - dfs
  - priority_queue
---

![[problems/pictures/Pasted image 20240910023550.png]]
![[problems/pictures/Pasted image 20240910023600.png]]


```c++
class Solution {  
public:  
  vec<vec<int>> dirs = {  
      {1, 0},  
      {-1, 0},  
      {0, 1},  
      {0, -1},  
  };  
  
  int minimumTime(vec<vec<int>> &grid) {  
    if (grid[0][1] > 1 && grid[1][0] > 1)  
      return -1;  
  
    int M = grid.size(), N = grid[0].size();  
    auto pq_comp = [](vec<int> &a, vec<int> &b) { return a[2] > b[2]; };  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);  
    pq.push({0, 0, 0});  
  
    vec<vec<bool>> visited(M, vec<bool>(N));  
  
    while (!pq.empty()) {  
      auto entry = pq.top();  
      pq.pop();  
  
      int row = entry[0], col = entry[1], time = entry[2];  
      if (row == M - 1 && col == N - 1)  
        return time;  
  
      visited[row][col] = true;  
  
      for (auto &&dir : dirs) {  
        int r = row + dir[0], c = col + dir[1];  
        if (r < 0 || r == M || c < 0 || c == N || visited[r][c])  
          continue;  
  
        if (grid[r][c] <= time + 1)  
          pq.push({r, c, time + 1});  
        else {  
          int diff = grid[r][c] - time;  
          if (diff % 2)  
            pq.push({r, c, grid[r][c]});  
          else  
            pq.push({r, c, grid[r][c] + 1});  
        }  
      }  
    }  
  
    return -1;  
  }  
};
```


```c++
class Solution_2 {  
public:  
  vec<vec<int>> dirs = {  
      {1, 0},  
      {-1, 0},  
      {0, 1},  
      {0, -1},  
  };  
  
  int minimumTime(vec<vec<int>> &grid) {  
    if (grid[0][1] > 1 && grid[1][0] > 1)  
      return -1;  
  
    int M = grid.size(), N = grid[0].size();  
  
    vec<vec<int>> distTo(M, vec<int>(N, std::numeric_limits<int>::max()));  
    distTo[0][0] = 0;  
  
    auto pq_comp = [](vec<int> &a, vec<int> &b) { return a[2] > b[2]; };  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);  
    pq.push({0, 0, 0});  
  
    //        vec<vec<bool>> visited(M, vec<bool>(N));  
  
    while (!pq.empty()) {  
      auto cur = pq.top();  
      pq.pop();  
      for (auto &&dir : dirs) {  
        int r = cur[0] + dir[0], c = cur[1] + dir[1];  
        if (r < 0 || r == M || c < 0 || c == N)  
          continue;  
  
        int distance = cur[2] + 1;  
  
        if (distance < grid[r][c]) {  
          if (distance % 2 == grid[r][c] % 2) {  
            distance = grid[r][c];  
          } else {  
            distance = grid[r][c] + 1;  
          }  
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