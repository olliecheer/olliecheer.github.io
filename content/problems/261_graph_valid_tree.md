---
tags:
  - union_find
  - dfs
---
![[problems/pictures/Pasted image 20241014002111.png]]
![[problems/pictures/Pasted image 20241014002120.png]]


## Find Union

```c++
// find circle in un-directed graph  
template <typename T> using vec = std::vector<T>;

class Solution {
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

public:
  bool validTree(int n, vec<vec<int>> &edges) {
    DSU dsu(n);
    for (auto &e : edges) {
      if (dsu.find(e[0]) == dsu.find(e[1]))
        return false;

      dsu.union_(e[0], e[1]);
    }

    return edges.size() == n - 1;
  }
};
```



## DFS with parent

```c++
// find circle in un-directed graph  
template <typename T> using vec = std::vector<T>;

class Solution {
  bool hasCycle(vec<vec<int>> &graph, int u, vec<bool> &visited, int parent) {
    visited[u] = true;
    for (auto v : graph[u]) {
      if (!visited[v]) {
        if (hasCycle(graph, v, visited, u))
          return true;
      } else {
        if (v != parent)
          return true;
      }
    }
    return false;
  }

public:
  bool validTree(int n, vec<vec<int>> &edges) {
    vec<vec<int>> graph(n);

    for (auto &&e : edges) {
      int u = e[0], v = e[1];
      graph[u].push_back(v);
      graph[v].push_back(u);
    }

    vec<bool> visited(n);
    if (hasCycle(graph, 0, visited, -1))
      return false;

    for (int i = 0; i < n; i++)
      if (!visited[i])
        return false;

    return true;
  }
};
```