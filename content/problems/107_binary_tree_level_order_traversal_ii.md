---
tags:
  - binary_tree
  - level_order
  - traversal
---
![[problems/pictures/Pasted image 20240908024857.png]]


```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
public:  
  vec<vec<int>> levelOrderBottom(TreeNode *root) {  
    vec<vec<int>> res;  
    std::queue<TreeNode *> q;  
    TreeNode *cur = root;  
    if (cur != nullptr)  
      q.push(cur);  
  
    while (!q.empty()) {  
      int sz = q.size();  
      vec<int> level;  
      for (int i = 0; i < sz; i++) {  
        auto cur = q.front();  
        level.push_back(cur->val);  
        if (cur->left)  
          q.push(cur->left);  
  
        if (cur->right)  
          q.push(cur->right);  
      }  
      res.push_back(level);  
    }  
  
    std::reverse(res.begin(), res.end());  
    return res;  
  }  
};
```