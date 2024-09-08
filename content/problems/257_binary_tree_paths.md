---
tags:
  - binary_tree
---

![[problems/pictures/Pasted image 20240908222921.png]]


```c++
struct TreeNode {  
  std::string val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
  void helper(TreeNode *root, std::string path, vec<std::string> &res) {  
    if (!root->left && !root->right) {  
      res.push_back(path);  
      return;  
    }  
  
    if (root->left)  
      helper(root->left, path + "->" + root->left->val, res);  
  
    if (root->right)  
      helper(root->right, path + "->" + root->right->val, res);  
  }  
  
public:  
  vec<std::string> binaryTreePaths(TreeNode *root) {  
    vec<std::string> res;  
    if (root)  
      helper(root, root->val, res);  
  
    return res;  
  }  
};
```