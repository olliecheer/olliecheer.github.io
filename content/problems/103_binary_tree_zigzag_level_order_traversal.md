---
tags:
  - binary_tree
  - zigzag
  - traversal
  - level_order
  - bfs
  - dfs
---
![[problems/pictures/Pasted image 20240908024356.png]]
![[problems/pictures/Pasted image 20240908024406.png]]


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
  vec<vec<int>> zigzagLevelOrder(TreeNode *root) {
    vec<vec<int>> res;
    std::queue<TreeNode *> q;
    if (root)
      q.push(root);

    while (!q.empty()) {
      auto sz = q.size();
      vec<int> level_res;
      for (int i = 0; i < sz; i++) {
        auto node = q.front();
        q.pop();
        level_res.push_back(node->val);
        if (node->left)
          q.push(node->left);

        if (node->right)
          q.push(node->right);
      }

      if (res.size() % 2 == 1)
        std::reverse(level_res.begin(), level_res.end());

      res.push_back(std::move(level_res));
    }

    return res;
  }
};
```


## DFS

```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<vec<int>> zigzagLevelOrder(TreeNode *root) {
    vec<vec<int>> res;
    std::function<void(TreeNode *, int)> dfs;

    dfs = [&res, &dfs](TreeNode *node, int height) {
      if (!node)
        return;

      if (height == res.size())
        res.emplace_back();

      res[height].push_back(node->val);

      if (node->left)
        dfs(node->left, height + 1);

      if (node->right)
        dfs(node->right, height + 1);
    };

    dfs(root, 0);

    for (int i = 0; i < res.size(); i++) {
      if (i % 2 == 1)
        std::reverse(res[i].begin(), res[i].end());
    }

    return res;
  }
};
```