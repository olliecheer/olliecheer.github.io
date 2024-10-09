---
tags:
  - binary_tree
---
![[problems/pictures/Pasted image 20240910015415.png]]
![[problems/pictures/Pasted image 20240910015419.png]]


### 2 Pass

```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {

  TreeNode *dfs(TreeNode *cur, int target) {
    if (!cur)
      return nullptr;

    if (cur->val == target)
      return cur;

    auto left = dfs(cur->left, target);
    auto right = dfs(cur->right, target);
    return left == nullptr ? right : left;
  }

  TreeNode *lca(TreeNode *root, TreeNode *p, TreeNode *q) {
    if (!root || root == p || root == q)
      return root;

    auto left = lca(root->left, p, q);
    auto right = lca(root->right, p, q);
    if (left && right)
      return root;

    if (left)
      return left;
    if (right)
      return right;

    return nullptr;
  }

public:
  TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q) {
    auto p_node = dfs(root, p->val);
    auto q_node = dfs(root, q->val);
    return (p_node && q_node) ? lca(root, p_node, q_node) : nullptr;
  }
};
```


### 1 Pass

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int count = 0;

  TreeNode *lca(TreeNode *root, TreeNode *p, TreeNode *q) {
    if (!root)
      return root;

    auto left = lca(root->left, p, q);
    auto right = lca(root->right, p, q);

    if (root == p || root == q) {
      count++;
      return root;
    }

    if (!left)
      return right;

    if (!right)
      return left;

    return root;
  }

public:
  TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q) {
    auto res = lca(root, p, q);
    if (count != 2)
      return nullptr;
    else
      return res;
  }
};
```