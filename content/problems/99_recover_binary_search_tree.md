---
tags:
  - binary_search_tree
  - inorder
  - recursion
  - iteration
---


![[problems/pictures/Pasted image 20240908024032.png]]
![[problems/pictures/Pasted image 20240908024043.png]]

```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

class Solution {
public:
  void recoverTree(TreeNode *root) {
    TreeNode *first = nullptr, *second = nullptr;
    TreeNode *prev = new TreeNode{INT_MIN};
    std::stack<TreeNode *> stk;
    auto cur = root;

    while (cur || !stk.empty()) {
      while (cur) {
        stk.push(cur);
        cur = cur->left;
      }

      cur = stk.top();
      stk.pop();
      if (cur->val < prev->val) {
        if (first == nullptr) {
          first = prev;
          second = cur;
        } else
          second = cur;
      }

      prev = cur;
      cur = cur->right;
    }

    std::swap(first->val, second->val);
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
  TreeNode *prev{new TreeNode{std::numeric_limits<int>::min()}};
  TreeNode *first, *second;

  void inorder(TreeNode *root) {
    if (!root)
      return;

    inorder(root->left);
    if (prev->val > root->val) {
      if (!first)
        first = prev;
      second = root;
    }

    prev = root;
    inorder(root->right);
  }

public:
  void recoverTree(TreeNode *root) {
    if (!root)
      return;

    inorder(root);

    if (first && second)
      std::swap(first->val, second->val);
  }
};
```