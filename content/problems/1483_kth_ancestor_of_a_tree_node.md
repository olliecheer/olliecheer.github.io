---
tags:
  - tree
---
![[problems/pictures/Pasted image 20240910014248.png]]
![[problems/pictures/Pasted image 20240910014256.png]]


```c++
class TreeAncestor {  
  std::unordered_map<int, vec<int>> children;  
  vec<vec<int>> memo;  
  
  void dfs(int cur) {}  
  
public:  
  TreeAncestor(int n, vec<int> &parent) : memo(n, vec<int>(20)) {  
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
  
        node = memo[node][i];  
      }  
  
      k /= 2;  
    }  
  
    return node;  
  }  
};
```