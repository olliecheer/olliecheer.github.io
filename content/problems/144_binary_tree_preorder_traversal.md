---
tags:
  - binary_tree
  - traversal
  - preorder
---
![[pictures/Pasted image 20241013234442.png]]
![[pictures/Pasted image 20241013234455.png]]
![[pictures/Pasted image 20241013234505.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> preorderTraversal(TreeNode *root) {
    vec<int> res;
    std::stack<TreeNode *> stk;
    auto cur = root;

    if (cur)
      stk.push(cur);

    while (!stk.empty()) {
      cur = stk.top();
      stk.pop();
      res.push_back(cur->val);
      if (cur->right)
        stk.push(cur->right);

      if (cur->left)
        stk.push(cur->left);
    }
    return res;
  }
};
```