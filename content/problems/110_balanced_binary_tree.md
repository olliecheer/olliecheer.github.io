---
tags:
  - binary_tree
  - balanced
---
![[pictures/Pasted image 20241013232701.png]]
![[pictures/Pasted image 20241013232717.png]]




```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  int heightTree(TreeNode *root) {
    if (!root)
      return 0;

    int left = heightTree(root->left);
    if (left == -1)
      return -1;

    int right = heightTree(root->right);
    if (right == -1)
      return -1;

    if (std::abs(left - right) > 1)
      return -1;

    return std::max(left, right) + 1;
  }

public:
  bool isBalanced(TreeNode *root) { return heightTree(root) != -1; }
};
```