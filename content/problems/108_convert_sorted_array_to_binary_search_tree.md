---
tags:
  - binary_tree
  - array
  - tree_construct
---
![[problems/pictures/Pasted image 20241013232628.png]]
![[problems/pictures/Pasted image 20241013232639.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  TreeNode *helper(vec<int> &nums, int start, int end) {
    if (start > end)
      return nullptr;

    int mid = start + (end - start) / 2;
    TreeNode *root = new TreeNode{nums[mid]};
    root->left = helper(nums, start, mid - 1);
    root->right = helper(nums, mid + 1, end);
    return root;
  }

public:
  TreeNode *sortedArrayToBST(vec<int> &nums) {
    return helper(nums, 0, nums.size() - 1);
  }
};
```