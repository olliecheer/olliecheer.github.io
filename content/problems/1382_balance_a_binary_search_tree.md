---
tags:
  - binary_search_tree
---
![[problems/pictures/Pasted image 20240910012523.png]]
![[problems/pictures/Pasted image 20240910012530.png]]


```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  void dfs(TreeNode *root, vec<int> &res) {
    if (!root)
      return;

    dfs(root->left, res);
    res.push_back(root->val);
    dfs(root->right, res);
  }

  TreeNode *build(int left, int right, vec<int> &res) {
    if (left > right)
      return nullptr;
    int mid = left + (right - left) / 2;
    TreeNode *node = new TreeNode{res[mid]};
    node->left = build(left, mid - 1, res);
    node->right = build(mid + 1, right, res);
    return node;
  }

public:
  TreeNode *balanceBST(TreeNode *root) {
    vec<int> res;
    dfs(root, res);
    return build(0, res.size() - 1, res);
  }
};
```
