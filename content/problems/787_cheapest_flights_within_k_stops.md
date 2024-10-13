---
tags:
  - dijkstra
  - bellman
---
![[pictures/Pasted image 20241012094434.png]]
![[pictures/Pasted image 20241012094454.png]]
![[pictures/Pasted image 20241012094510.png]]
![[pictures/Pasted image 20241012094526.png]]


```c++
// dijkstra is based on greedy algo  
// weights of edges are required non-negative  
// time complexity: O(V^2)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int findCheapestPrice(int n, vec<vec<int>> &flights, int src, int dst,
                        int k) {
    vec<vec<std::pair<int, int>>> adj(n);
    for (auto e : flights)
      adj[e[0]].push_back({e[1], e[2]});

    vec<int> stops(n, INT_MAX);
    std::priority_queue<vec<int>, vec<vec<int>>, std::greater<vec<int>>> pq;
    // {dist_from_src_node, node, number_of_stops_from_src_node}
    pq.push({0, src, 0});

    while (!pq.empty()) {
      auto temp = pq.top();
      pq.pop();
      int dist = temp[0];
      int node = temp[1];
      int steps = temp[2];
      // We have already encountered a path with a lower cost and fewer stops,
      // or the number of stops exceeds the limit.
      if (steps > stops[node] || steps > k + 1)
        continue;
      stops[node] = steps;
      if (node == dst)
        return dist;
      for (auto &[neighbor, price] : adj[node])
        pq.push({dist + price, neighbor, steps + 1});
    }
    return -1;
  }
};
```


```c++
// bellman-ford algo is based on dynamic programming  
// weights of edges can be non-negative  
// time complexity: O(V*E)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int findCheapestPrice(int n, vec<vec<int>> &flights, int src, int dst,
                        int k) {
    // Distance from source to all other nodes.
    vec<int> dist(n, INT_MAX);
    dist[src] = 0;

    // Run only K+1 times since we want shortest distance in K hops.
    for (int i = 0; i <= k; i++) {
      // Create a copy of dist vector.
      vec<int> temp(dist);
      for (auto &flight : flights) {
        if (dist[flight[0]] != INT_MAX) {
          temp[flight[1]] =
              std::min(temp[flight[1]], dist[flight[0]] + flight[2]);
        }
      }
      // Copy the temp vector into dist.
      dist = temp;
    }
    return dist[dst] == INT_MAX ? -1 : dist[dst];
  }
};
```