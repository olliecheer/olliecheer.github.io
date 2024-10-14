---
tags:
  - common_ancestor
  - binary_tree
---
![[problems/pictures/Pasted image 20241014001518.png]]
![[problems/pictures/Pasted image 20241014001527.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

class Solution {
  TreeNode *res{};

  bool dfs(TreeNode *root, TreeNode *p, TreeNode *q) {
    if (!root)
      return false;

    bool left_son = dfs(root->left, p, q);
    bool right_son = dfs(root->right, p, q);

    if ((left_son && right_son) ||
        ((root->val == p->val || root->val == q->val) &&
         (left_son || right_son)))
      res = root;

    return left_son || right_son ||
           (root->val == p->val || root->val == q->val);
  }

public:
  TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q) {
    dfs(root, p, q);
    return res;
  }
};
```