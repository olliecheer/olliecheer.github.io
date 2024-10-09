---
tags:
  - binary_search_tree
---
![[problems/pictures/Pasted image 20240908184146.png]]
![[problems/pictures/Pasted image 20240908184156.png]]


```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

class BSTIterator {
  std::stack<TreeNode *> stk;

  void push_all_left(TreeNode *root) {
    while (root) {
      stk.push(root);
      root = root->left;
    }
  }

public:
  explicit BSTIterator(TreeNode *root) { push_all_left(root); }

  bool hasNext() { return !stk.empty(); }

  int next() {
    auto cur = stk.top();
    stk.pop();
    push_all_left(cur->right);
    return cur->val;
  }
};
```