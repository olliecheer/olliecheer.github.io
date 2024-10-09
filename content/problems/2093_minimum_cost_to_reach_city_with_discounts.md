---
tags:
  - priority_queue
---
![[problems/pictures/Pasted image 20240910021125.png]]
![[problems/pictures/Pasted image 20240910021129.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minimumCost(int n, vec<vec<int>> &highways, int discounts) {
    vec<vec<vec<int>>> graph(n);
    for (auto &&it : highways) {
      int a = it[0], b = it[1], c = it[2];
      graph[a].push_back({b, c});
      graph[b].push_back({a, c});
    }

    auto pq_comp = [](vec<int> &a, vec<int> &b) { return a[0] > b[0]; };
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);
    pq.push({0, 0, discounts});
    vec<vec<int>> visited(
        n, vec<int>(discounts + 1, std::numeric_limits<int>::max()));
    visited[0][0] = 0;

    while (!pq.empty()) {
      auto cur = pq.top();
      pq.pop();

      int cost = cur[0], city = cur[1], dis = cur[2];
      if (city == n - 1)
        return cost;

      for (auto &&it : graph[city]) {
        int next = it[0], weight = it[1];
        if (cost + weight < visited[next][dis]) {
          pq.push({cost + weight, next, dis});
          visited[next][dis] = cost + weight;
        }

        if (dis > 0 && cost + weight / 2 < visited[next][dis - 1]) {
          pq.push({cost + weight / 2, next, dis - 1});
          visited[next][dis - 1] = cost + weight / 2;
        }
      }
    }

    return -1;
  }
};
```