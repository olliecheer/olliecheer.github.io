---
tags:
  - common_ancestor
---
![[problems/pictures/Pasted image 20240910015725.png]]
![[problems/pictures/Pasted image 20240910015728.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
  
  TreeNode *dfs(TreeNode *root, std::unordered_set<int> &st) {  
    if (!root)  
      return nullptr;  
    if (st.count(root->val))  
      return root;  
  
    auto left = dfs(root->left, st);  
    auto right = dfs(root->right, st);  
  
    if (left && right)  
      return root;  
  
    if (left)  
      return left;  
  
    if (right)  
      return right;  
  
    return nullptr;  
  }  
  
public:  
  TreeNode *lowestCommonAncestor(TreeNode *root, vec<TreeNode *> nodes) {  
    std::unordered_set<int> st;  
    for (auto it : nodes)  
      st.insert(it->val);  
  
    return dfs(root, st);  
  }  
};
```