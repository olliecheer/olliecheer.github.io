---
tags:
  - binary_tree
  - traversal
  - preorder
---

![[problems/pictures/Pasted image 20240908181209.png]]
![[problems/pictures/Pasted image 20240908181223.png]]


```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
public:  
  vec<int> preorderTraversal(TreeNode *root) {  
    vec<int> res;  
    std::stack<TreeNode *> stk;  
    auto cur = root;  
  
    if (cur)  
      stk.push(cur);  
  
    while (!stk.empty()) {  
      cur = stk.top();  
      stk.pop();  
      res.push_back(cur->val);  
      if (cur->right)  
        stk.push(cur->right);  
  
      if (cur->left)  
        stk.push(cur->left);  
    }  
    return res;  
  }  
};
```