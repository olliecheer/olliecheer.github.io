---
tags:
  - dfs
---
![[problems/pictures/Pasted image 20240908185328.png]]

```c++
class Solution {  
public:  
  vec<int> findOrder(int numCourses, vec<vec<int>> &prerequisites) {  
    vec<int> res(numCourses), indegree(numCourses);  
    vec<vec<int>> graph(numCourses, vec<int>(numCourses));  
  
    for (int i = 0; i < prerequisites.size(); i++) {  
      graph[prerequisites[i][1]].push_back(prerequisites[i][0]);  
      indegree[prerequisites[i][0]]++;  
    }  
  
    std::queue<int> q;  
    for (int i = 0; i < indegree.size(); i++) {  
      if (indegree[i] == 0)  
        q.push(i);  
    }  
  
    int count = 0;  
    while (!q.empty()) {  
      int cur = q.front();  
      q.pop();  
      res[count] = cur;  
      count++;  
  
      for (int next : graph[cur]) {  
        indegree[next]--;  
        if (indegree[next] == 0)  
          q.push(next);  
      }  
    }  
  
    return count == numCourses ? res : vec<int>{};  
  }  
};
```


```c++
class Solution_DFS {  
  std::unordered_map<int, vec<int>> graph;  
  vec<int> visited; // 0: unvisited, 1: in progress, 2: visited  
  bool is_valid = true;  
  vec<int> res;  
  int index;  
  
  void dfs(int node) {  
    visited[node] = 1;  
  
    for (int neighbor : graph[node]) {  
      if (visited[neighbor] == 0)  
        dfs(neighbor);  
      else if (visited[neighbor] == 1)  
        is_valid = false;  
    }  
    res[index] = node;  
    index++;  
    visited[node] = 2;  
  }  
  
public:  
  vec<int> findOrder(int numCourses, vec<vec<int>> &edges) {  
    int N = numCourses;  
    res = vec<int>(N);  
    visited = vec<int>(N);  
    for (auto &&e : edges)  
      graph[e[0]].push_back(e[1]);  
  
    for (int i = 0; i < N; i++)  
      if (visited[i] == 0)  
        dfs(i);  
  
    return is_valid ? res : vec<int>{};  
  }  
};
```