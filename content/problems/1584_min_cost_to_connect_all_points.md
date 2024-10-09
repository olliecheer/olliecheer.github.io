---
tags:
  - prim
  - graph
---

![[problems/pictures/Pasted image 20240910014933.png]]
![[problems/pictures/Pasted image 20240910014943.png]]
![[problems/pictures/Pasted image 20240910014952.png]]


```c++
// Prim  
// Good at sparse graph. Time complexity: O(ElogV)  
// But when it comes to dense graph, time complexity will fall back to  
// O(V^2logV)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minCostConnectPoints(vec<vec<int>> points) {
    int N = points.size();
    std::priority_queue<std::pair<int, int>, vec<std::pair<int, int>>,
                        std::greater<>>
        pq(std::greater<>{});
    vec<bool> inMST(N);
    pq.emplace(0, 0);

    int costs = 0, edgesUsed = 0;

    while (edgesUsed < N) {
      auto cur = pq.top();
      pq.pop();
      int weight = cur.first;
      int node = cur.second;

      if (inMST[node])
        continue;
      inMST[node] = true;

      costs += weight;
      edgesUsed++;

      for (int next = 0; next < N; next++) {
        if (!inMST[next]) {
          int next_weight = std::abs(points[node][0] - points[next][0]) +
                            std::abs(points[node][1] - points[next][1]);
          pq.emplace(next_weight, next);
        }
      }
    }

    return costs;
  }
};
```


```c++
// O(V^2)  
// prim
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minCostConnectPoints(vec<vec<int>> &points) {
    int N = points.size();
    vec<vec<int>> matrix(N, vec<int>(N));

    for (int i = 0; i < N; i++)
      for (int j = 0; j < N; j++)
        matrix[i][j] = std::abs(points[i][0] - points[j][0]) +
                       std::abs(points[i][1] - points[j][1]);

    vec<bool> visited(N);
    vec<int> distance(N, std::numeric_limits<int>::max());
    distance[0] = 0;

    for (int i = 0; i < N; i++) {
      int next_close = -1;
      for (int j = 0; j < N; j++)
        if (!visited[j] &&
            (next_close == -1 || distance[j] < distance[next_close]))
          next_close = j;

      visited[next_close] = true;
      for (int k = 0; k < N; k++)
        if (!visited[k])
          distance[k] = std::min(distance[k], matrix[next_close][k]);
    }

    return std::accumulate(distance.begin(), distance.end(), 0);
  }
};
```