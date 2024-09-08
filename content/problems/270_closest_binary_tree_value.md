---
tags:
  - binary_tree
---
// vip


```c++
class Solution {  
  struct TreeNode {  
    int val;  
    TreeNode *left;  
    TreeNode *right;  
  };  
  
  int res = 0;  
  double min_diff = std::numeric_limits<double>::max();  
  
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