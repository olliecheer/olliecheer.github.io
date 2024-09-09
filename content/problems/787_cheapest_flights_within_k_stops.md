---
tags:
  - dijkstra
  - bellman
---
![[problems/pictures/Pasted image 20240910001136.png]]
![[problems/pictures/Pasted image 20240910001148.png]]
![[problems/pictures/Pasted image 20240910001159.png]]

```c++
// dijkstra is based on greedy algo  
// weights of edges are required non-negative  
// time complexity: O(V^2)  
class Solution_dijkstra {  
public:  
  int findCheapestPrice(int n, vec<vec<int>> &flights, int src, int dst,  
                        int k) {  
    std::unordered_map<int, std::unordered_map<int, int>> prices;  
    for (auto &&f : flights)  
      prices[f[0]].insert({f[1], f[2]});  
  
    auto pq_comp = [](vec<int> &a, vec<int> &b) { return a[0] > b[0]; };  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);  
    pq.push({0, src, k + 1});  
  
    while (!pq.empty()) {  
      auto cur = pq.top();  
      pq.pop();  
      int price = cur[0], city = cur[1], stops = cur[2];  
      if (city == dst)  
        return price;  
  
      if (stops > 0) {  
        if (prices.count(city) == 0) {  
          prices[city] = {};  
        }  
        auto &&neighbors_price = prices[city];  
        for (auto it : neighbors_price) {  
          int neighbor = it.first;  
          pq.push({price + neighbors_price[neighbor], neighbor, stops - 1});  
        }  
      }  
    }  
  
    return -1;  
  }  
};
```


```c++
// bellman-ford algo is based on dynamic programming  
// weights of edges can be non-negative  
// time complexity: O(V*E)  
class Solution_bellman_ford {  
public:  
  int findCheapestPrice(int n, vec<vec<int>> &flights, int src, int dst,  
                        int k) {  
    vec<int> cost(n, std::numeric_limits<int>::max());  
    cost[src] = 0;  
    int res = std::numeric_limits<int>::max();  
  
    for (int i = 0; i <= k; i++) {  
      vec<int> cur = cost;  
      for (auto &&f : flights)  
        cur[f[1]] = std::min(cur[f[1]], cost[f[0]] + f[2]);  
  
      res = std::min(res, cur[dst]);  
      cost = cur;  
    }  
  
    return res == std::numeric_limits<int>::max() ? -1 : res;  
  }  
};
```