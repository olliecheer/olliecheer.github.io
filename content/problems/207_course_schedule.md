---
tags:
  - dfs
  - bfs
---
![[problems/pictures/Pasted image 20240908185033.png]]

```c++
class Solution_BFS {  
public:  
  bool canFinish(int numCourses, vec<vec<int>> &prerequisites) {  
    std::unordered_map<int, vec<int>> graph;  
    vec<int> indegree(numCourses);  
  
    for (auto const &edge : prerequisites) {  
      int from = edge[1], to = edge[0];  
      graph[from].push_back(to);  
      indegree[to]++;  
    }  
  
    std::queue<int> q;  
  
    for (int i = 0; i < numCourses; i++) {  
      if (indegree[i] == 0) {  
        q.push(i);  
      }  
    }  
  
    int count = 0;  
  
    while (!q.empty()) {  
      int cur = q.front();  
      q.pop();  
      count++;  
  
      if (graph.count(cur) == 0) {  
        continue;  
      }  
  
      for (int it : graph[cur]) {  
        indegree[it]--;  
        if (indegree[it] == 0) {  
          q.push(it);  
        }  
      }  
    }  
  
    return count == numCourses;  
  }  
};
```


```c++
class Solution_DFS {  
  vec<vec<int>> edges;  
  vec<int> visited; // 0: unvisited, 1: searching, 2: visited  
  bool valid = true;  
  
public:  
  bool canFinish(int numCourses, vec<vec<int>> &prerequisites) {  
    edges = decltype(edges)(numCourses);  
    visited = decltype(visited)(numCourses);  
  
    for (auto const &edge : prerequisites) {  
      int from = edge[1], to = edge[0];  
      edges[to].push_back(from);  
    }  
  
    for (int i = 0; i < numCourses; i++) {  
      if (visited[i] == 0) {  
        dfs(i);  
      }  
    }  
    return valid;  
  }  
  
  void dfs(int node) {  
    visited[node] = 1;  
    for (int v : edges[node]) {  
      if (visited[v] == 0) {  
        dfs(v);  
      } else if (visited[v] == 1) {  
        valid = false;  
      }  
    }  
    visited[node] = 2;  
  }  
};
```