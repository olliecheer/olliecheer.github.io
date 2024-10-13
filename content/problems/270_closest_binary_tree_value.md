---
tags:
  - binary_tree
---
![[pictures/Pasted image 20241014002459.png]]
![[pictures/Pasted image 20241014002505.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  int res = 0;
  double min_diff = INT_MAX;

  void dfs(TreeNode *root, double target) {
    if (!root)
      return;

    double diff = std::abs(root->val - target);
    if (diff < min_diff) {
      min_diff = diff;
      res = root->val;
    }

    if (root->val > target)
      dfs(root->left, target);
    else
      dfs(root->right, target);
  }

public:
  int closestValue(TreeNode *root, double target) {
    dfs(root, target);
    return res;
  }
};
```