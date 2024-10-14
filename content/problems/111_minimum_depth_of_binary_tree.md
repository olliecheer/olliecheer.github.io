---
tags:
  - binary_tree
  - tree_depth
---
![[problems/pictures/Pasted image 20241013232751.png]]
![[problems/pictures/Pasted image 20241013232759.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minDepth(TreeNode *root) {
    if (!root)
      return 0;
    int depth = 1;
    std::queue<TreeNode *> q;
    q.push(root);

    while (!q.empty()) {
      int sz = q.size();
      for (int i = 0; i < sz; i++) {
        auto cur = q.front();
        q.pop();
        if (!cur->left && !cur->right)
          return depth;

        if (cur->left)
          q.push(cur->left);

        if (cur->right)
          q.push(cur->right);
      }
      depth++;
    }

    return depth;
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
public:
  int minDepth(TreeNode *root) {
    if (!root)
      return 0;
    if (!root->left)
      return minDepth(root->right) + 1;

    if (!root->right)
      return minDepth(root->left) + 1;

    return std::min(minDepth(root->right), minDepth(root->left)) + 1;
  }
};
```