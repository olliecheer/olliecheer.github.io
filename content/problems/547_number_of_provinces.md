---
tags:
  - union_find
---
![[pictures/Pasted image 20241010220723.png]]
![[pictures/Pasted image 20241010220733.png]]


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
  int findCircleNum(vec<vec<int>> &M) {
    DSU dsu(M.size());
    for (int i = 0; i < M.size(); i++)
      for (int j = 0; j < M[i].size(); j++)
        if (M[i][j] == 1)
          dsu.union_(i, j);

    int res = 0;
    for (int i = 0; i < M.size(); i++)
      if (dsu.find(i) == i)
        res++;

    return res;
  }
};
```
