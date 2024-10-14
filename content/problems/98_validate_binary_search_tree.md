---
tags:
  - binary_search_tree
  - recursion
  - iteration
---
![[problems/pictures/Pasted image 20241013232121.png]]
![[problems/pictures/Pasted image 20241013232138.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

class Solution {
public:
  bool isValidBST(TreeNode *root) {
    TreeNode *prev = nullptr;
    std::stack<TreeNode *> stk;

    while (root || !stk.empty()) {
      while (root) {
        stk.push(root);
        root = root->left;
      }
      root = stk.top();
      stk.pop();

      if (prev && root->val <= prev->val)
        return false;

      prev = root;
      root = root->right;
    }

    return true;
  }
};
```


```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

class Solution {
  bool helper(TreeNode *root, long min, long max) {
    return !root || (min < root->val && max > root->val &&
                     helper(root->left, min, root->val) &&
                     helper(root->right, root->val, max));
  }

public:
  bool isValidBST(TreeNode *root) { return helper(root, LONG_MIN, LONG_MAX); }
};
```