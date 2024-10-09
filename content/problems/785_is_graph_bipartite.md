---
tags:
  - graph
  - dfs
  - coloring
---
![[problems/pictures/Pasted image 20240910001010.png]]
![[problems/pictures/Pasted image 20240910001020.png]]
![[problems/pictures/Pasted image 20240910001028.png]]

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