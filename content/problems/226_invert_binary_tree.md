---
tags:
  - binary_tree
---

![[problems/pictures/Pasted image 20240908191545.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
public:  
  TreeNode *invertTree(TreeNode *root) {  
    if (!root) {  
      return root;  
    }  
  
    auto left = invertTree(root->left);  
    auto right = invertTree(root->right);  
    root->right = left;  
    root->left = right;  
    return root;  
  }  
};
```

```c++
class Solution_Interation {  
public:  
  TreeNode *invertTree(TreeNode *root) {  
    if (!root) {  
      return root;  
    }  
  
    auto node = root;  
    std::queue<TreeNode *> q;  
    q.push(node);  
  
    while (!q.empty()) {  
      auto cur = q.front();  
      q.pop();  
      auto tmp = cur->left;  
  
      cur->left = cur->right;  
      cur->right = tmp;  
  
      if (cur->left) {  
        q.push(cur->left);  
      }  
      if (cur->right) {  
        q.push(cur->right);  
      }  
    }  
  
    return root;  
  }  
};
```