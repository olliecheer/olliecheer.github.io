---
tags:
  - binary_tree
---
![[problems/pictures/Pasted image 20240908184539.png]]


```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
public:  
  vec<int> rightSideView(TreeNode *root) {  
    vec<int> res;  
    std::queue<TreeNode *> q;  
    auto node = root;  
  
    if (!node) {  
      q.push(node);  
    }  
  
    while (!q.empty()) {  
      int sz = q.size();  
      for (int i = 0; i < sz; i++) {  
        auto cur = q.front();  
        q.pop();  
        if (i == sz - 1) {  
          res.push_back(cur->val);  
        }  
  
        if (cur->left) {  
          q.push(cur->left);  
        }  
        if (cur->right) {  
          q.push(cur->right);  
        }  
      }  
    }  
  
    return res;  
  }  
};
```


```c++
class Solution_Recursion {  
  vec<int> res;  
  
  void helper(TreeNode *root, int level) {  
    if (!root) {  
      return;  
    }  
  
    if (res.size() == level) {  
      res.push_back(root->val);  
    }  
  
    helper(root->right, level + 1);  
    helper(root->left, level + 1);  
  }  
  
public:  
  vec<int> rightSideView(TreeNode *root) {  
    helper(root, 0);  
    return res;  
  }  
};
```