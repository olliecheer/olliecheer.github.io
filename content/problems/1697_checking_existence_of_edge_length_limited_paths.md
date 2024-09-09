---
tags:
  - path
---
![[problems/pictures/Pasted image 20240910015903.png]]
![[problems/pictures/Pasted image 20240910015914.png]]

```c++
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
  vec<bool> distanceLimitedPathsExists(int n, vec<vec<int>> &edge_list,  
                                       vec<vec<int>> &queries) {  
    int M = edge_list.size(), N = edge_list[0].size();  
    DSU dsu(N);  
  
    for (int i = 0; i < queries.size(); i++)  
      queries[i].push_back(i);  
  
    std::sort(queries.begin(), queries.end(),  
              [](auto &a, auto &b) { return a[2] < b[2]; });  
  
    std::sort(edge_list.begin(), edge_list.end(),  
              [](auto &a, auto &b) { return a[2] < b[2]; });  
  
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