---
tags:
  - union_find
  - prim
---
![[problems/pictures/Pasted image 20241013220318.png]]
![[problems/pictures/Pasted image 20241013220329.png]]

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


### Prim java

```java
class Solution {
    public int minCostToSupplyWater(int n, int[] wells, int[][] pipes) {
        // min heap to maintain the order of edges to be visited.
        PriorityQueue<Pair<Integer, Integer>> edgesHeap =
                new PriorityQueue<>(n, (a, b) -> (a.getKey() - b.getKey()));

        // representation of graph in adjacency list
        List<List<Pair<Integer, Integer>>> graph = new ArrayList<>(n + 1);
        for (int i = 0; i < n + 1; ++i) {
            graph.add(new ArrayList<Pair<Integer, Integer>>());
        }

        // add a virtual vertex indexed with 0,
        //   then add an edge to each of the house weighted by the cost
        for (int i = 0; i < wells.length; ++i) {
            Pair<Integer, Integer> virtualEdge = new Pair<>(wells[i], i + 1);
            graph.get(0).add(virtualEdge);
            // initialize the heap with the edges from the virtual vertex.
            edgesHeap.add(virtualEdge);
        }

        // add the bidirectional edges to the graph
        for (int i = 0; i < pipes.length; ++i) {
            int house1 = pipes[i][0];
            int house2 = pipes[i][1];
            int cost = pipes[i][2];
            graph.get(house1).add(new Pair<Integer, Integer>(cost, house2));
            graph.get(house2).add(new Pair<Integer, Integer>(cost, house1));
        }

        // kick off the exploration from the virtual vertex 0
        Set<Integer> mstSet = new HashSet<>();
        mstSet.add(0);

        int totalCost = 0;
        while (mstSet.size() < n + 1) {
            Pair<Integer, Integer> edge = edgesHeap.poll();
            int cost = edge.getKey();
            int nextHouse = edge.getValue();
            if (mstSet.contains(nextHouse)) {
                continue;
            }

            // adding the new vertex into the set
            mstSet.add(nextHouse);
            totalCost += cost;

            // expanding the candidates of edge to choose from in the next round
            for (Pair<Integer, Integer> neighborEdge : graph.get(nextHouse)) {
                if (!mstSet.contains(neighborEdge.getValue())) {
                    edgesHeap.add(neighborEdge);
                }
            }
        }

        return totalCost;
    }
}
```