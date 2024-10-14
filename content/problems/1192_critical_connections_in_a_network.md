---
tags:
  - tarjan
  - dfs
  - graph
---
![[problems/pictures/Pasted image 20241013220655.png]]
![[problems/pictures/Pasted image 20241013220701.png]]


```c++
// Tarjan's Algorithm  
// find the strongly connected components of a directed graph  
// T(n) = O(E+V)  
template <typename T> using vec = std::vector<T>;

class Solution {
  std::unordered_map<int, vec<int>> graph;
  std::unordered_map<int, int> time_map;
  vec<vec<int>> res;

  void dfs(int parent, int cur, int time, std::unordered_set<int> &visited) {
    visited.insert(cur);
    // time_map.insert({cur, time});
    time_map[cur] = time;

    for (int neighbor : graph[cur]) {
      if (neighbor == parent)
        continue;

      if (!visited.count(neighbor))
        dfs(cur, neighbor, time + 1, visited);

      time_map[cur] = std::min(time_map[cur], time_map[neighbor]);
      if (time < time_map[neighbor])
        res.push_back({cur, neighbor});
    }
  }

public:
  vec<vec<int>> criticalConnections(int n, vec<vec<int>> &edges) {
    for (auto &e : edges) {
      graph[e[0]].push_back(e[1]);
      graph[e[1]].push_back(e[0]);
    }
    std::unordered_set<int> visited;
    dfs(-1, 0, 0, visited);
    return res;
  }
};
```


### Tarjan 2

```c++
template <typename T> using vec = std::vector<T>;

class Solution {

  vec<vec<int>> graph;
  vec<int> dfn, low;
  int N, time;
  vec<vec<int>> res;

  void dfs(int cur, int parent) {
    time++;
    low[cur] = time;
    dfn[cur] = time;

    for (int neighbor : graph[cur]) {
      if (neighbor == parent)
        continue;

      if (dfn[neighbor] == -1) {
        dfs(neighbor, cur);
        if (low[neighbor] > dfn[cur])
          res.push_back({cur, neighbor});
      }
      low[cur] = std::min(low[cur], low[neighbor]);
    }
  }

public:
  vec<vec<int>> criticalConnections(int n, vec<vec<int>> &edges) {
    N = n;
    graph = vec<vec<int>>(N);
    time = 0;
    dfn = vec<int>(N, -1);
    low = vec<int>(N);

    for (auto &&e : edges) {
      graph[e[0]].push_back(e[1]);
      graph[e[1]].push_back(e[0]);
    }

    for (int i = 0; i < N; i++)
      if (dfn[i] == -1)
        dfs(i, i);

    return res;
  }
};
```