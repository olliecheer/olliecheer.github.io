---
tags:
  - binary_tree
---
![[pictures/Pasted image 20241010220344.png]]
![[pictures/Pasted image 20241010220353.png]]


```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  int max_diameter = 0;

  int maxDepth(TreeNode *root) {
    if (!root)
      return 0;

    int left = maxDepth(root->left);
    int right = maxDepth(root->right);

    max_diameter = std::max(max_diameter, left + right);
    return std::max(left, right) + 1;
  }

public:
  int diameterOfBinaryTree(TreeNode *root) {
    maxDepth(root);
    return max_diameter;
  }
};
```
