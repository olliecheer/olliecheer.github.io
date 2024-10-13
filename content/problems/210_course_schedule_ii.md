---
tags:
  - dfs
---
![[pictures/Pasted image 20241014000132.png]]
![[pictures/Pasted image 20241014000143.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> findOrder(int numCourses, vec<vec<int>> &prerequisites) {
    vec<int> res, indegree(numCourses);
    vec<vec<int>> graph(numCourses);

    for (int i = 0; i < prerequisites.size(); i++) {
      int former = prerequisites[i][1];
      int latter = prerequisites[i][0];
      graph[former].push_back(latter);
      indegree[latter]++;
    }

    std::queue<int> q;
    for (int i = 0; i < indegree.size(); i++) {
      if (indegree[i] == 0)
        q.push(i);
    }

    while (!q.empty()) {
      int cur = q.front();
      q.pop();
      res.push_back(cur);

      for (int next : graph[cur]) {
        indegree[next]--;
        if (indegree[next] == 0)
          q.push(next);
      }
    }

    return res.size() == numCourses ? res : vec<int>{};
  }
};
```


## DFS

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
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