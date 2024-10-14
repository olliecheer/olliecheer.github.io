---
tags:
  - binary_tree
---
![[problems/pictures/Pasted image 20241014000946.png]]
![[problems/pictures/Pasted image 20241014000955.png]]




```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

class Solution {
public:
  TreeNode *invertTree(TreeNode *root) {
    if (!root)
      return root;

    auto left = invertTree(root->left);
    auto right = invertTree(root->right);
    root->right = left;
    root->left = right;
    return root;
  }
};
```

```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

class Solution {
public:
  TreeNode *invertTree(TreeNode *root) {
    if (!root)
      return root;

    auto node = root;
    std::queue<TreeNode *> q;
    q.push(node);

    while (!q.empty()) {
      auto cur = q.front();
      q.pop();
      
      std::swap(cur->left, cur->right);

      if (cur->left) {
        q.push(cur->left);
      }
      if (cur->right) {
        q.push(cur->right);
      }
    }

    return root;
  }
};
```