---
tags:
  - priority_queue
  - dijkstra
---
![[problems/pictures/Pasted image 20241009223858.png]]
![[problems/pictures/Pasted image 20241009223910.png]]
![[problems/pictures/Pasted image 20241009223922.png]]
![[problems/pictures/Pasted image 20241009223936.png]]
![[problems/pictures/Pasted image 20241009223947.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minimumCost(int n, vec<vec<int>> &highways, int discounts) {
    // construct the graph from the given highways array
    vec<vec<std::pair<int, int>>> graph(n);
    for (int i = 0; i < highways.size(); ++i) {
      int u = highways[i][0], v = highways[i][1], toll = highways[i][2];
      graph[u].push_back({v, toll});
      graph[v].push_back({u, toll});
    }

    // Min-heap priority queue to store tuples of (cost, city,
    // discountsUsed)
    std::priority_queue<std::tuple<int, int, int>,
                        vec<std::tuple<int, int, int>>, std::greater<>>
        pq;
    pq.push(std::make_tuple(
        0, 0, 0)); // Start from city 0 with cost 0 and 0 discounts used

    // 2D array to track minimum distance to each city with a given number
    // of discounts used
    vec<vec<int>> dist(n, vec<int>(discounts + 1, INT_MAX));
    dist[0][0] = 0;

    vec<vec<bool>> visited(n, vec<bool>(discounts + 1, false));

    while (!pq.empty()) {
      // int currentCost, city, discountsUsed;
      auto [currentCost, city, discountsUsed] = pq.top();
      pq.pop();

      // Skip processing if already visited with the same number of
      // discounts used
      if (visited[city][discountsUsed])
        continue;

      visited[city][discountsUsed] = true;

      // Explore all neighbors of the current city
      for (int i = 0; i < graph[city].size(); ++i) {
        int neighbor = graph[city][i].first;
        int toll = graph[city][i].second;

        // Case 1: Move to the neighbor without using a discount
        if (currentCost + toll < dist[neighbor][discountsUsed]) {
          dist[neighbor][discountsUsed] = currentCost + toll;
          pq.push(std::make_tuple(dist[neighbor][discountsUsed], neighbor,
                                  discountsUsed));
        }

        // Case 2: Move to the neighbor using a discount if available
        if (discountsUsed < discounts) {
          int newCostWithDiscount = currentCost + toll / 2;
          if (newCostWithDiscount < dist[neighbor][discountsUsed + 1]) {
            dist[neighbor][discountsUsed + 1] = newCostWithDiscount;
            pq.push(std::make_tuple(newCostWithDiscount, neighbor,
                                    discountsUsed + 1));
          }
        }
      }
    }

    // Find the minimum cost to reach city n-1 with any number of discounts
    // used
    int minCost = *std::min_element(dist[n - 1].begin(), dist[n - 1].end());
    return minCost == INT_MAX ? -1 : minCost;
  }
};
```