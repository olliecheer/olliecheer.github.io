---
tags:
  - binary_tree
  - traversal
---
![[pictures/Pasted image 20241013233443.png]]
![[pictures/Pasted image 20241013233514.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

class Solution {
  int max_value = INT_MIN;

  int helper(TreeNode *node) {
    if (!node)
      return 0;

    int left = std::max(0, helper(node->left));
    int right = std::max(0, helper(node->right));

    max_value = std::max(max_value, left + right + node->val);
    return std::max(left, right) + node->val;
  }

public:
  int maxPathSum(TreeNode *root) {
    helper(root);
    return max_value;
  }
};
```