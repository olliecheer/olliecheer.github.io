---
tags:
  - binary_tree
---
![[problems/pictures/Pasted image 20240909225552.png]]
![[problems/pictures/Pasted image 20240909225603.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
  int max_val = 0;  
  
  vec<int> longestPath(TreeNode *root) {  
    if (!root)  
      return {};  
  
    int inc = 1, dec = 1;  
    if (root->left) {  
      auto left = longestPath(root->left);  
      if (root->val == root->left->val + 1)  
        dec = left[1] + 1;  
      else if (root->val == root->left->val - 1)  
        inc = left[0] + 1;  
    }  
  
    if (root->right) {  
      auto right = longestPath(root->right);  
      if (root->val == root->right->val + 1)  
        dec = std::max(dec, right[1] + 1);  
      else if (root->val == root->right->val - 1)  
        inc = std::max(inc, right[0] + 1);  
    }  
  
    max_val = std::max(max_val, dec + inc - 1);  
    return {inc, dec};  
  }  
  
public:  
  int longestConsecutive(TreeNode *root) {  
    longestPath(root);  
    return max_val;  
  }  
};
```
