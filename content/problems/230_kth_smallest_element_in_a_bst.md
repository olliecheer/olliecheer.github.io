---
tags:
  - binary_search_tree
---
![[problems/pictures/Pasted image 20241014001119.png]]
![[problems/pictures/Pasted image 20241014001135.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  vec<int> res;

  void helper(TreeNode *node) {
    if (!node)
      return;

    helper(node->left);
    res.push_back(node->val);
    helper(node->right);
  }

public:
  int kthSmallest(TreeNode *root, int k) {
    if (!root) {
      return 0;
    }
    helper(root);
    return res[k - 1];
  }
};
```


```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int kthSmallest(TreeNode *root, int k) {
    std::stack<TreeNode *> stk;
    auto node = root;
    while (node || !stk.empty()) {
      while (node) {
        stk.push(node);
        node = node->left;
      }
      node = stk.top();
      stk.pop();
      k--;
      if (k == 0)
        break;

      node = node->right;
    }

    return node->val;
  }
};
```


```c++
// **Follow up:** If the BST is modified often (i.e., we can do insert and delete operations) and you need to find the kth smallest frequently, how would you optimize?
struct TreeNodeWithSize {
  int val;
  int size;
  TreeNodeWithSize *left;
  TreeNodeWithSize *right;
};
```