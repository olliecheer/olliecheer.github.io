---
tags:
  - maze
  - priority_queue
  - dijkstra
---

![[problems/pictures/Pasted image 20240909224340.png]]

```c++
class Solution {  
  vec<vec<int>> dirs = {  
      {0, 1},  
      {0, -1},  
      {1, 0},  
      {-1, 0},  
  };  
  
  void dijkstra(vec<vec<int>> &maze, vec<int> &start, vec<vec<int>> &distance) {  
    auto pq_comp = [](vec<int> const &a, vec<int> const &b) {  
      return a[2] < b[2];  
    };  
  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);  
    pq.push({start[0], start[1], 0});  
  
    while (!pq.empty()) {  
      auto cur = pq.top();  
      pq.pop();  
  
      for (auto &&dir : dirs) {  
        int x = cur[0] + dir[0];  
        int y = cur[1] + dir[1];  
        int count = 0;  
  
        while (x >= 0 && y >= 0 && x < maze.size() && y < maze[0].size() &&  
               maze[x][y] == 0) {  
          x += dir[0];  
          y += dir[1];  
          count++;  
        }  
  
        x -= dir[0];  
        y -= dir[1];  
        if (distance[cur[0]][cur[1]] + count < distance[x][y]) {  
          distance[x][y] = distance[cur[0]][cur[1]] + count;  
          pq.push({x, y, distance[x][y]});  
        }  
      }  
    }  
  }  
  
public:  
  int shortestDistance(vec<vec<int>> &maze, vec<int> &start,  
                       vec<int> &destination) {  
    vec<vec<int>> distance(  
        maze.size(), vec<int>(maze[0].size(), std::numeric_limits<int>::max()));  
    distance[start[0]][start[1]] = 0;  
    dijkstra(maze, start, distance);  
  
    if (distance[destination[0]][destination[1]] ==  
        std::numeric_limits<int>::max())  
      return -1;  
    else  
      return distance[destination[0]][destination[1]];  
  }  
};
```