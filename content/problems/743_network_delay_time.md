---
tags:
  - dijkstra
  - floyd
---
![[problems/pictures/Pasted image 20240910000311.png]]
![[problems/pictures/Pasted image 20240910000321.png]]

```c++
// Floyd-Warshall algorithm  
// Time complexity: O(N^3)  
// Space complexity: O(N^2)  
class Solution {  
public:  
  int networkDelayTime(vec<vec<int>> &times, int N, int K) {  
    vec<vec<double>> graph(  
        N + 1, vec<double>(N + 1, std::numeric_limits<double>::max()));  
    for (int i = 0; i <= N; i++)  
      graph[i][i] = 0;  
  
    for (auto &&e : times)  
      graph[e[0]][e[1]] = e[2];  
  
    for (int i = 1; i <= N; i++)  
      for (int j = 1; j <= N; j++)  
        for (int k = 1; i <= N; k++)  
          if (graph[i][j] > graph[i][k] + graph[k][j])  
            graph[i][j] > graph[i][k] + graph[k][j];  
  
    double res = std::numeric_limits<double>::min();  
  
    for (int i = 1; i <= N; i++) {  
      if (graph[K][i] == std::numeric_limits<double>::max())  
        return -1;  
  
      res = std::max(res, graph[K][i]);  
    }  
  
    return (int)res;  
  }  
};
```


```c++
class Solution_dijkstra {  
  std::unordered_map<int, int> dist;  
  
public:  
  int networkDelayTime(vec<vec<int>> &times, int N, int K) {  
    std::unordered_map<int, vec<vec<int>>> graph;  
    for (auto &&e : times)  
      graph[e[0]].push_back({e[1], e[2]});  
  
    for (int i = 1; i <= N; i++)  
      dist[i] = std::numeric_limits<int>::max();  
  
    dist[K] = 0;  
    vec<bool> visited(N + 1);  
    while (true) {  
      int cur_node = -1;  
      int cur_min_dist = std::numeric_limits<int>::max();  
      for (int i = 1; i <= N; i++) {  
        if (!visited[i] && dist[i] < cur_min_dist) {  
          cur_min_dist = dist[i];  
          cur_node = i;  
        }  
      }  
  
      if (cur_node < 0)  
        break;  
      visited[cur_node] = true;  
      for (auto &&neighbor : graph[cur_node]) {  
        dist[neighbor[0]] =  
            std::min(dist[neighbor[0]], dist[cur_node] + neighbor[1]);  
      }  
    }  
  
    int res = 0;  
    for (auto &&it : dist) {  
      int distance = it.first;  
      if (distance == std::numeric_limits<int>::max())  
        return -1;  
  
      res = std::max(res, distance);  
    }  
  
    return res;  
  }  
};
```


```c++
class Solution_dijkstra_2 {  
public:  
  int networkDelayTime(vec<vec<int>> &times, int N, int K) {  
    std::unordered_map<int, vec<vec<int>>> graph;  
    for (auto &&e : times)  
      graph[e[0]].push_back({e[1], e[2]});  
  
    auto pq_comp = [](vec<int> &a, vec<int> &b) { return a[0] > b[0]; };  
  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);  
    pq.push({0, K});  
  
    std::unordered_map<int, int> dist;  
    int res;  
    while (!pq.empty()) {  
      auto cur = pq.top();  
      int distance = cur[0];  
      int node = cur[1];  
  
      if (dist.count(node))  
        continue;  
  
      dist[node] = distance;  
      res = std::max(res, distance);  
  
      for (auto &&e : graph[node]) {  
        int neighbor = e[0];  
        int distance_2 = e[1];  
  
        if (!dist.count(neighbor))  
          pq.push({distance + distance_2, neighbor});  
      }  
    }  
  
    if (dist.size() != N)  
      return -1;  
  
    return res;  
  }  
};
```