---
tags:
  - path
  - offline_algorithm
---
![[problems/pictures/Pasted image 20241013225818.png]]
![[problems/pictures/Pasted image 20241013225829.png]]
![[problems/pictures/Pasted image 20241013225840.png]]
![[problems/pictures/Pasted image 20241013225851.png]]



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

    void union_(int x, int y) { parent[find(x)] = parent[find(y)]; }
  };

public:
  vec<bool> distanceLimitedPathsExist(int n, vec<vec<int>> &edge_list,
                                      vec<vec<int>> &queries) {
    int M = edge_list.size(), N = queries.size();
    DSU dsu(n);

    for (int i = 0; i < N; i++)
      queries[i].push_back(i);

    std::sort(queries.begin(), queries.end(),
              [](auto &a, auto &b) { return std::less{}(a[2], b[2]); });

    std::sort(edge_list.begin(), edge_list.end(),
              [](auto &a, auto &b) { return std::less{}(a[2], b[2]); });

    vec<bool> res(N);

    for (int i = 0, j = 0; i < N; i++) {
      while (j < M && edge_list[j][2] < queries[i][2]) {
        dsu.union_(edge_list[j][0], edge_list[j][1]);
        j++;
      }

      res[queries[i][3]] = (dsu.find(queries[i][0]) == dsu.find(queries[i][1]));
    }

    return res;
  }
};
```