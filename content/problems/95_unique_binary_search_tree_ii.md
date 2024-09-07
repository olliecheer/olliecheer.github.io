---
tags:
  - binary_search_tree
---

![[problems/pictures/Pasted image 20240908023543.png]]


```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
  
  vec<TreeNode *> helper(int start, int end) {  
    vec<TreeNode *> res;  
    if (start > end)  
      res.push_back(nullptr);  
  
    for (int i = start; i <= end; i++) {  
      auto left_list = helper(start, i - 1);  
      auto right_list = helper(i + 1, end);  
  
      for (auto left : left_list) {  
        for (auto right : right_list) {  
          auto root = new TreeNode{i};  
          root->left = left;  
          root->right = right;  
          res.push_back(root);  
        }  
      }  
    }  
  
    return res;  
  }  
  
public:  
  vec<TreeNode *> generateTrees(int n) {  
    if (n == 0)  
      return {};  
  
    return helper(1, n);  
  }  
};
```
