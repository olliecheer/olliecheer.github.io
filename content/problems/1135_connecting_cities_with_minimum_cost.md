---
tags:
  - prim
  - kruscal
---
![[problems/pictures/Pasted image 20240910004940.png]]
![[problems/pictures/Pasted image 20240910004947.png]]


```c++
class Solution_prim_1 {  
public:  
  int minimumCost(int N, vec<vec<int>> &connections) {  
    std::unordered_map<int, vec<vec<int>>> graph;  
    for (auto &&edge : connections) {  
      int x = edge[0], y = edge[1], cost = edge[2];  
      graph[x].push_back({y, cost});  
      graph[y].push_back({x, cost});  
    }  
  
    auto pq_comp = [](vec<int> &a, vec<int> &b) { return a[2] > b[2]; };  
  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);  
    pq.push({1, 1, 0});  
    std::unordered_set<int> visited;  
    int costs = 0;  
  
    while (!pq.empty()) {  
      auto &&cur = pq.top();  
      pq.pop();  
  
      int x = cur[0], y = cur[1], cost = cur[2];  
      if (visited.count(y) == 0) {  
        visited.insert(y);  
        costs += cost;  
        for (auto &&neighbor : graph[y]) {  
          pq.push({y, neighbor[0], neighbor[1]});  
        }  
      }  
    }  
  
    return visited.size() == N ? costs : -1;  
  }  
};
```


```c++
class Solution_kruscal {  
  class DSU {  
    vec<int> parent;  
  
  public:  
    explicit DSU(int N) : parent{N} {  
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
  int minimumCost(int N, vec<vec<int>> &connections) {  
    std::sort(connections.begin(), connections.end(),  
              [](vec<int> &a, vec<int> &b) { return a[2] < b[2]; });  
  
    DSU dsu(N + 1);  
    int res = 0;  
  
    for (auto &&it : connections) {  
      int x = dsu.find(it[0]);  
      int y = dsu.find(it[1]);  
      if (x != y) {  
        dsu.union_(it[0], it[1]);  
        res += it[2];  
        N--;  
      }  
    }  
  
    return N == 1 ? res : -1;  
  }  
};
```