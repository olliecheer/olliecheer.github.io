---
tags:
  - common_ancestor
---
![[problems/pictures/Pasted image 20240910004718.png]]
![[problems/pictures/Pasted image 20240910004728.png]]
![[problems/pictures/Pasted image 20240910004737.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
// O(n^2)  
template <typename T> using vec = std::vector<T>;

class Solution {
  int height(TreeNode *root) {
    if (!root)
      return 0;

    return 1 + std::max(height(root->left), height(root->right));
  }

public:
  TreeNode *lcaDeepestLeaves(TreeNode *root) {
    if (!root)
      return nullptr;
    int left = height(root->left);
    int right = height(root->right);
    if (left < right)
      return lcaDeepestLeaves(root->right);
    else if (left > right)
      return lcaDeepestLeaves(root->left);
    else
      return root;
  }
};
```


```c++
// O(n)  
template <typename T> using vec = std::vector<T>;

class Solution {
  struct Pair {
    TreeNode *node;
    int d;
  };

  Pair *get_lca(TreeNode *root, int d) {
    if (!root)
      return new Pair{nullptr, d};

    auto left = get_lca(root->left, d + 1);
    auto right = get_lca(root->right, d + 1);

    if (left->d > right->d)
      return left;
    else if (left->d < right->d)
      return right;
    else
      return new Pair{root, left->d};
  }

public:
  TreeNode *lcaDeepestLeaves(TreeNode *root) {
    auto p = get_lca(root, 0);
    return p->node;
  }
};
```