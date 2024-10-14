---
tags:
  - binary_tree
  - traversal
  - inorder
---
![[problems/pictures/Pasted image 20241013231833.png]]
![[problems/pictures/Pasted image 20241013231855.png]]
![[problems/pictures/Pasted image 20241013231905.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> inorderTraversal(TreeNode *root) {
    vec<int> res;
    std::stack<TreeNode *> stk;
    auto cur = root;
    while (cur || !stk.empty()) {
      while (cur) {
        stk.push(cur);
        cur = cur->left;
      }

      cur = stk.top();
      stk.pop();
      res.push_back(cur->val);
      cur = cur->right;
    }

    return res;
  }
};
```