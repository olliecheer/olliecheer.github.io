---
tags:
  - binary_tree
  - dfs
---

![[problems/pictures/Pasted image 20240910012944.png]]
![[problems/pictures/Pasted image 20240910012954.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
  int res;  
  
  void dfs(TreeNode *root, int max) {  
    if (!root)  
      return;  
  
    if (root->val >= max)  
      res++;  
  
    dfs(root->left, std::max(max, root->val));  
    dfs(root->right, std::max(max, root->val));  
  }  
  
public:  
  int goodNodes(TreeNode *root) {  
    dfs(root, std::numeric_limits<int>::min());  
    return res;  
  }  
};
```