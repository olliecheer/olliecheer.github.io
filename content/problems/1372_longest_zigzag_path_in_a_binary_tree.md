---
tags:
  - binary_tree
---
![[problems/pictures/Pasted image 20240910012254.png]]
![[problems/pictures/Pasted image 20240910012302.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
  int max = 0;  
  
  std::pair<int, int> dfs(TreeNode *root) {  
    std::pair<int, int> res{}; // {left_sum, right_sum}  
    if (!root)  
      return res;  
  
    auto left = dfs(root->left);  
    auto right = dfs(root->right);  
  
    res.first = left.second + 1;  
    res.second = right.first + 1;  
    max = std::max({max, res.first, res.second});  
    return res;  
  }  
  
public:  
  int longestZigZag(TreeNode *root) {  
    dfs(root);  
    return max == 0 ? 0 : max - 1;  
  }  
};
```