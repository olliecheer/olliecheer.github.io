---
tags:
  - binary_tree
  - dfs
---
![[problems/pictures/Pasted image 20241013201704.png]]
![[problems/pictures/Pasted image 20241013201716.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  int res = 0;

  int dfs(TreeNode *root) {
    if (!root)
      return 2;

    int left = dfs(root->left);
    int right = dfs(root->right);

    if (left == 0 || right == 0) {
      res++;
      return 1;
    }

    if (left == 1 || right == 1)
      return 2;

    if (left == 2 && right == 2)
      return 0;

    abort();
  }

public:
  int minCameraCover(TreeNode *root) { return (dfs(root) < 1 ? 1 : 0) + res; }
};
```