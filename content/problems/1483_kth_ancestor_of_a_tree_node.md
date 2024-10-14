---
tags:
  - tree
---
![[problems/pictures/Pasted image 20241013224321.png]]
![[problems/pictures/Pasted image 20241013224332.png]]
![[problems/pictures/Pasted image 20241013224343.png]]



```c++
template <typename T> using vec = std::vector<T>;

class TreeAncestor {
  std::unordered_map<int, vec<int>> children;
  vec<vec<std::optional<int>>> memo;

  void dfs(int cur) {
    for (int i = 1; memo[cur][i - 1]; i++) {
      int jump_to_next_node = memo[cur][i - 1].value();
      memo[cur][i] = memo[jump_to_next_node][i - 1];
    }

    for (int child : children[cur])
      dfs(child);
  }

public:
  TreeAncestor(int n, vec<int> &parent) : memo(n, vec<std::optional<int>>(20)) {
    for (int i = 0; i < n; i++) {
      int cur_node = i;
      int parent_node = parent[i];
      children[parent_node].push_back(cur_node);

      if (i > 0)
        memo[cur_node][0] = parent[i];
    }

    dfs(0);
  }

  int getKthAncestor(int node, int k) {
    for (int i = 0; k > 0; i++) {
      if (k % 2 == 1) {
        if (!memo[node][i])
          return -1;

        node = memo[node][i].value();
      }

      k /= 2;
    }

    return node;
  }
};
```