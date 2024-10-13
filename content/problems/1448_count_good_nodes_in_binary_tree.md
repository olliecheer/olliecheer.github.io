---
tags:
  - binary_tree
  - dfs
---
![[pictures/Pasted image 20241013224051.png]]
![[pictures/Pasted image 20241013224059.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

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