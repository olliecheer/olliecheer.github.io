---
tags:
  - binary_search_tree
  - tree_construct
  - preorder
---
![[problems/pictures/Pasted image 20240910003532.png]]
![[problems/pictures/Pasted image 20240910003540.png]]


```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  int i = 0;

  TreeNode *bstFromPreorder(vec<int> &nums, int uppper_bound) {
    if (i == nums.size() || nums[i] > uppper_bound)
      return nullptr;

    auto root = new TreeNode{nums[i]};
    i++;
    root->left = bstFromPreorder(nums, root->val);
    root->right = bstFromPreorder(nums, uppper_bound);
    return root;
  }

public:
  TreeNode *bstFromPreorder(vec<int> &nums) {
    return bstFromPreorder(nums, std::numeric_limits<int>::max());
  }
};
```