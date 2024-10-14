---
tags:
  - binary_tree
  - tree_construct
  - inorder
  - postorder
---
![[problems/pictures/Pasted image 20241013232438.png]]
![[problems/pictures/Pasted image 20241013232505.png]]


```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  vec<int> inorder, postorder;
  int postorder_index;
  std::unordered_map<int, int> mp;

  TreeNode *helper(int in_start, int in_end) {
    if (in_start > in_end)
      return nullptr;

    auto root = new TreeNode{postorder[postorder_index]};
    postorder_index--;

    int in_index = mp[root->val];
    root->right = helper(in_index + 1, in_end);
    root->left = helper(in_start, in_index - 1);
    return root;
  }

public:
  TreeNode *buildTree(vec<int> &_inorder, vec<int> &_postorder) {
    inorder = std::move(_inorder);
    postorder = std::move(_postorder);
    postorder_index = postorder.size() - 1;
    int N = inorder.size();

    for (int i = 0; i < N; i++)
      mp[inorder[i]] = i;

    return helper(0, N - 1);
  }
};
```