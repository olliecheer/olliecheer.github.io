---
tags:
  - binary_tree
  - traversal
  - postorder
---
![[pictures/Pasted image 20241013234540.png]]
![[pictures/Pasted image 20241013234551.png]]
![[pictures/Pasted image 20241013234558.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> postorderTraversal(TreeNode *root) {
    vec<int> res;
    std::stack<TreeNode *> stk;
    auto cur = root;

    for (TreeNode *prev = nullptr; cur || !stk.empty();) {
      while (cur) {
        stk.push(cur);
        cur = cur->left;
      }
      cur = stk.top();
      stk.pop();

      if (cur->right == nullptr || cur->right == prev) {
        res.push_back(cur->val);
        prev = cur;
        cur = nullptr;
      } else {
        stk.push(cur);
        cur = cur->right;
      }
    }

    return res;
  }
};
```