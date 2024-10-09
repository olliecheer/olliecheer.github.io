---
tags:
  - dijkstra
  - floyd
---
![[problems/pictures/Pasted image 20240910000311.png]]
![[problems/pictures/Pasted image 20240910000321.png]]


### Floyd Warshall

```c++
// Floyd-Warshall algorithm  
// Time complexity: O(N^3)  
// Space complexity: O(N^2)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int networkDelayTime(vec<vec<int>> times, int N, int K) {
    vec<vec<double>> graph(N + 1, vec<double>(N + 1, INT_MAX));
    for (int i = 0; i <= N; i++)
      graph[i][i] = 0;

    for (auto &&e : times)
      graph[e[0]][e[1]] = e[2];

    for (int k = 1; k <= N; k++)
      for (int i = 1; i <= N; i++)
        for (int j = 1; j <= N; j++)
          if (graph[i][j] > graph[i][k] + graph[k][j])
            graph[i][j] = graph[i][k] + graph[k][j];

    double res = INT_MIN;

    for (int i = 1; i <= N; i++) {
      if (graph[K][i] == INT_MAX)
        return -1;

      res = std::max(res, graph[K][i]);
    }

    return (int)res;
  }
};
```

### Dijkstra

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  // Adjacency list, defined it as per the maximum number of nodes
  // But can be defined with the input size as well
  vec<std::pair<int, int>> adj[101];

  void dijkstra(vec<int> &signalReceivedAt, int source, int n) {
    std::priority_queue<std::pair<int, int>, vec<std::pair<int, int>>,
                        std::greater<std::pair<int, int>>>
        pq;
    pq.push({0, source});

    // Time for starting node is 0
    signalReceivedAt[source] = 0;

    while (!pq.empty()) {
      int currNodeTime = pq.top().first;
      int currNode = pq.top().second;
      pq.pop();

      if (currNodeTime > signalReceivedAt[currNode]) {
        continue;
      }

      // Broadcast the signal to adjacent nodes
      for (std::pair<int, int> edge : adj[currNode]) {
        int time = edge.first;
        int neighborNode = edge.second;

        // Fastest signal time for neighborNode so far
        // signalReceivedAt[currNode] + time :
        // time when signal reaches neighborNode
        if (signalReceivedAt[neighborNode] > currNodeTime + time) {
          signalReceivedAt[neighborNode] = currNodeTime + time;
          pq.push({signalReceivedAt[neighborNode], neighborNode});
        }
      }
    }
  }

  int networkDelayTime(vec<vec<int>> &times, int n, int k) {
    // Build the adjacency list
    for (vec<int> time : times) {
      int source = time[0];
      int dest = time[1];
      int travelTime = time[2];

      adj[source].push_back({travelTime, dest});
    }

    vec<int> signalReceivedAt(n + 1, INT_MAX);
    dijkstra(signalReceivedAt, k, n);

    int answer = INT_MIN;
    for (int i = 1; i <= n; i++) {
      answer = std::max(answer, signalReceivedAt[i]);
    }

    // INT_MAX signifies atleat one node is unreachable
    return answer == INT_MAX ? -1 : answer;
  }
};
```
