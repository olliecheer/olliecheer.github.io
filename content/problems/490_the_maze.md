---
tags:
  - dfs
  - bfs
  - maze
---
![[problems/pictures/Pasted image 20240909224017.png]]
![[problems/pictures/Pasted image 20240909224024.png]]


```c++
class Solution_BFS {  
  vec<vec<int>> dirs = {  
      {0, 1},  
      {0, -1},  
      {-1, 0},  
      {1, 0},  
  };  
  
  bool bfs(vec<vec<int>> &maze, vec<vec<bool>> &visited, std::queue<vec<int>> q,  
           vec<int> &destination) {  
    int M = maze.size(), N = maze[0].size();  
    while (!q.empty()) {  
      auto cur = q.front();  
      q.pop();  
  
      if (cur == destination)  
        return true;  
  
      for (auto &dir : dirs) {  
        int x = cur[0], y = cur[1];  
        while (x + dir[0] >= 0 && y + dir[1] >= 0 && x + dir[0] < M &&  
               y + dir[1] < N && maze[x + dir[0]][y + dir[1]] == 0) {  
          x += dir[0];  
          y += dir[1];  
        }  
  
        if (!visited[x][y]) {  
          q.push({x, y});  
          visited[x][y] = true;  
        }  
      }  
    }  
  
    return false;  
  }  
  
public:  
  bool hasPath(vec<vec<int>> maze, vec<int> start, vec<int> destination) {  
    int M = maze.size(), N = maze[0].size();  
    vec<vec<bool>> visited;  
    std::queue<vec<int>> q;  
    q.push(start);  
    visited[start[0]][start[1]] = true;  
    return bfs(maze, visited, q, destination);  
  }  
};
```



```c++
class Solution_DFS {  
  vec<vec<int>> dirs = {  
      {0, 1},  
      {0, -1},  
      {-1, 0},  
      {1, 0},  
  };  
  
  bool dfs(vec<vec<int>> &maze, vec<vec<bool>> &visited, vec<int> cur,  
           vec<int> &destination) {  
    int M = maze.size(), N = maze[0].size();  
    if (visited[cur[0]][cur[1]])  
      return false;  
  
    if (cur == destination)  
      return true;  
  
    visited[cur[0]][cur[1]] = true;  
  
    for (auto &dir : dirs) {  
      int x = cur[0], y = cur[1];  
      while (x + dir[0] >= 0 && y + dir[1] >= 0 && x + dir[0] < M &&  
             y + dir[1] < N && maze[x + dir[0]][y + dir[1]] == 0) {  
        x += dir[0];  
        y += dir[1];  
      }  
  
      if (dfs(maze, visited, {x, y}, destination))  
        return true;  
    }  
  
    return false;  
  }  
  
public:  
  bool hasPath(vec<vec<int>> maze, vec<int> start, vec<int> destination) {  
    int M = maze.size(), N = maze[0].size();  
    vec<vec<bool>> visited;  
    return dfs(maze, visited, start, destination);  
  }  
};
```