---
tags:
  - binary_tree
---
![[problems/pictures/Pasted image 20241014002019.png]]
![[problems/pictures/Pasted image 20241014002026.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  void helper(TreeNode *root, std::string path, vec<std::string> &res) {
    if (!root->left && !root->right) {
      res.push_back(path);
      return;
    }

    if (root->left)
      helper(root->left, path + "->" + std::to_string(root->left->val), res);

    if (root->right)
      helper(root->right, path + "->" + std::to_string(root->right->val), res);
  }

public:
  vec<std::string> binaryTreePaths(TreeNode *root) {
    vec<std::string> res;
    if (root)
      helper(root, std::to_string(root->val), res);

    return res;
  }
};
```