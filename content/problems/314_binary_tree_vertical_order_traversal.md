---
tags:
  - binary_tree
  - traversal
  - vertical_order
  - dfs
  - bfs
---
![[pictures/Pasted image 20241014004002.png]]
![[pictures/Pasted image 20241014004017.png]]
![[pictures/Pasted image 20241014004028.png]]


## BFS

```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<vec<int>> verticalOrder(TreeNode *root) {
    vec<vec<int>> res;
    std::map<int, vec<int>> col2node;
    std::unordered_map<TreeNode *, int> position;
    std::queue<TreeNode *> q;
    if (root)
      q.push(root);

    position[root] = 0;
    int min = 0;

    while (!q.empty()) {
      auto cur = q.front();
      q.pop();
      int col = position[cur];
      col2node[col].push_back(cur->val);
      if (cur->left) {
        q.push(cur->left);
        position[cur->left] = col - 1;
      }

      if (cur->right) {
        q.push(cur->right);
        position[cur->right] = col + 1;
      }
      min = std::min(min, col);
    }

    for (auto &&it : col2node)
      res.push_back(it.second);

    return res;
  }
};
```


```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  std::map<int, vec<vec<int>>> col2node;

  void dfs(TreeNode *root, int depth, int offset) {
    if (!root)
      return;
    col2node[offset].push_back({depth, root->val});
    dfs(root->left, depth + 1, offset - 1);
    dfs(root->right, depth + 1, offset + 1);
  }

public:
  vec<vec<int>> verticalOrder(TreeNode *root) {
    vec<vec<int>> res;
    dfs(root, 0, 0);
    for (auto &&it : col2node) {
      auto &&nodes = it.second;
      std::sort(nodes.begin(), nodes.end(),
                [](vec<int> &a, vec<int> &b) { return a[0] < b[0]; });

      vec<int> tmp;
      for (auto &&node : nodes)
        tmp.push_back(node[1]);

      res.push_back(std::move(tmp));
    }

    return res;
  }
};
```