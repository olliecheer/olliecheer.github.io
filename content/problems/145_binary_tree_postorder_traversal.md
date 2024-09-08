---
tags:
  - binary_tree
  - traversal
  - postorder
---

![[problems/pictures/Pasted image 20240908181306.png]]
![[problems/pictures/Pasted image 20240908181348.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
public:  
  vec<int> postorderTraversal(TreeNode *root) {  
    vec<int> res;  
    std::stack<TreeNode *> stk;  
    auto cur = root;  
  
    for (TreeNode *prev = nullptr; cur || !stk.empty();) {  
      while (cur) {  
        stk.push(cur);  
        cur = cur->left;  
      }  
      cur = stk.top();  
      stk.pop();  
  
      if (cur->right == nullptr || cur->right == prev) {  
        res.push_back(cur->val);  
        prev = cur;  
        cur = nullptr;  
      } else {  
        stk.push(cur);  
        cur = cur->right;  
      }  
    }  
  
    return res;  
  }  
};
```