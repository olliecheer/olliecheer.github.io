---
tags:
  - binary_tree
---
![[problems/pictures/Pasted image 20240910004529.png]]


VIP has not been submitted

```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  double maxAvg;

  std::pair<int, int> sumTree(TreeNode *root) {
    if (!root)
      return {};

    std::pair<int, int> res;
    auto left = sumTree(root->left);
    auto right = sumTree(root->right);
    res.first = left.first + right.first + root->val;
    res.second = left.second + right.second + 1;
    maxAvg = std::max(maxAvg, (double)res.first / (double)res.second);
    return res;
  }

public:
  double maximumAverageSubtree(TreeNode *root) {
    maxAvg = 0.0;
    sumTree(root);
    return maxAvg;
  }
};
```