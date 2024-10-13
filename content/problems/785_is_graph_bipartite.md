---
tags:
  - graph
  - dfs
  - coloring
---
![[pictures/Pasted image 20241012092516.png]]
![[pictures/Pasted image 20241012092538.png]]
![[pictures/Pasted image 20241012092557.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool isBipartite(vec<vec<int>> &graph) {
    int n = graph.size();
    vec<int> color(n, -1);

    for (int start = 0; start < n; ++start) {
      if (color[start] == -1) {
        std::stack<int> stk;
        stk.push(start);
        color[start] = 0;

        while (!stk.empty()) {
          int node = stk.top();
          stk.pop();

          for (int neigh : graph[node]) {
            if (color[neigh] == -1) {
              stk.push(neigh);
              color[neigh] = color[node] ^ 1;
            } else if (color[neigh] == color[node])
              return false;
          }
        }
      }
    }
    return true;
  }
};
```