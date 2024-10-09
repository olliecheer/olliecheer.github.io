---
tags:
  - binary_search_tree
---
![[problems/pictures/Pasted image 20240909222850.png]]


```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  TreeNode *get_min(TreeNode *root) {
    if (root->left)
      return get_min(root->left);
    else
      return root;
  }

  TreeNode *delete_min(TreeNode *root) {
    if (root->left) {
      root->left = delete_min(root->left);
      return root;
    } else
      return root->right;
  }

public:
  TreeNode *deleteNode(TreeNode *root, int key) {
    if (!root)
      return nullptr;

    if (key > root->val)
      root->right = deleteNode(root->right, key);
    else if (key < root->val)
      root->left = deleteNode(root->left, key);
    else {
      if (!root->left)
        return root->right;
      if (!root->right)
        return root->left;

      auto cur = root;
      root = get_min(root->right);
      root->right = delete_min(cur->right);
      root->left = cur->left;
    }
    return root;
  }
};
```