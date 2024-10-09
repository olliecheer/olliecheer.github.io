---
tags:
  - union_find
  - prim
---

// vip

### Kruscal

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  class DSU {
    vec<int> parent;

  public:
    explicit DSU(int N) : parent(N) {
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
  int minCostToSupplyWater(int n, vec<int> &wells, vec<vec<int>> &pipes) {
    DSU dsu(n + 1);
    vec<vec<int>> edges;
    for (int i = 0; i < n; i++) {
      edges.push_back({0, i + 1, wells[i]});
    }

    for (auto &p : pipes)
      edges.push_back(p);

    std::sort(edges.begin(), edges.end(),
              [](auto &a, auto &b) { return std::less{}(a[2], b[2]); });

    int res = 0;
    for (auto &e : edges) {
      int x = e[0], y = e[1];
      if (dsu.find(x) == dsu.find(y))
        continue;

      dsu.union_(x, y);
      res += e[2];
    }

    return res;
  }
};
```


### Prim Not Pass

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minCostToSupplyWater(int n, vec<int> &wells, vec<vec<int>> &pipes) {
    std::unordered_map<int, std::unordered_map<int, int>> graph;
    for (int i = 1; i <= n; i++)
      graph[0][i] = wells[i - 1];
    // graph[0].insert({i, wells[i - 1]});

    for (int i = 0; i < pipes.size(); i++) {
      auto &e = pipes[i];
      int min_from_0_to_1 = INT_MAX;
      int min_from_1_to_0 = INT_MAX;
      if (graph[e[0]].count(e[1]))
        min_from_0_to_1 = graph[e[0]][e[1]];

      if (graph[e[1]].count(e[0]))
        min_from_0_to_1 = graph[e[1]][e[0]];

      graph[e[0]][e[1]] = std::min(e[2], min_from_0_to_1);
      graph[e[1]][e[0]] = std::min(e[2], min_from_1_to_0);
    }

    int res = 0;
    auto pq_comp = [](auto &a, auto &b) { return std::less{}(a[1], b[1]); };
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);
    pq.push({0, 0});
    std::unordered_set<int> visited;
    while (!pq.empty()) {
      auto cur = pq.top();
      pq.pop();
      int cur_node = cur[0];
      int distance = cur[1];
      if (visited.count(cur_node))
        continue;
      visited.insert(cur_node);

      res += distance;
      for (auto &it : graph[cur_node]) {
        int neighbor = it.first;
        if (!visited.count(neighbor))
          pq.push({neighbor, graph[cur_node][neighbor]});
      }
    }

    return res;
  }
};
```