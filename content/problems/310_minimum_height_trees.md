---
tags:
  - tree_depth
---
![[problems/pictures/Pasted image 20240909211752.png]]
![[problems/pictures/Pasted image 20240909211800.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> findMinHeightTrees(int n, vec<vec<int>> &edges) {
    if (n == 1)
      return {0};

    vec<vec<int>> adjacent(n);
    vec<int> indegree(n);
    for (auto const &e : edges) {
      int a = e[0], b = e[1];
      adjacent[a].push_back(b);
      indegree[a]++;
      adjacent[b].push_back(a);
      indegree[b]++;
    }

    vec<int> leaves;
    for (int i = 0; i < n; i++)
      if (indegree[i] == 1)
        leaves.push_back(i);

    while (n > 2) {
      vec<int> new_leaves;
      for (int leaf : leaves) {
        for (int it : adjacent[leaf]) {
          indegree[it]--;
          if (indegree[it] == 1)
            new_leaves.push_back(it);
        }
      }
      n -= leaves.size();
      leaves = std::move(new_leaves);
    }

    return leaves;
  }
};
```