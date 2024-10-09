---
tags:
  - common_ancestor
  - binary_search_tree
---
![[problems/pictures/Pasted image 20240908192057.png]]
![[problems/pictures/Pasted image 20240908192105.png]]

```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

class Solution {
public:
  TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q) {
    if (root->val > p->val && root->val > q->val) {
      return lowestCommonAncestor(root->left, p, q);
    } else if (root->val < p->val && root->val < q->val) {
      return lowestCommonAncestor(root->right, p, q);
    } else {
      return root;
    }
  }
};
```

