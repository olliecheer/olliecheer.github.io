---
tags:
  - binary_tree
  - traversal
  - level_order
  - recursion
  - iteration
---
![[pictures/Pasted image 20241013232253.png]]
![[pictures/Pasted image 20241013232303.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<vec<int>> levelOrder(TreeNode *root) {
    vec<vec<int>> res;
    std::queue<TreeNode *> q;

    auto node = root;
    if (node)
      q.push(node);

    while (!q.empty()) {
      int sz = q.size();
      vec<int> level;
      for (int i = 0; i < sz; i++) {
        auto cur = q.front();
        q.pop();

        level.push_back(cur->val);
        if (cur->left)
          q.push(cur->left);

        if (cur->right)
          q.push(cur->right);
      }
      res.push_back(std::move(level));
    }

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
  vec<vec<int>> res;

  void dfs(TreeNode *root, int height) {
    if (!root)
      return;

    if (height == res.size())
      res.emplace_back();

    res[height].push_back(root->val);
    if (root->left)
      dfs(root->left, height + 1);

    if (root->right)
      dfs(root->right, height + 1);
  }

public:
  vec<vec<int>> levelOrder(TreeNode *root) {
    dfs(root, 0);
    return res;
  }
};
```