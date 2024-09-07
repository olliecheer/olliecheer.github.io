---
tags:
  - binary_search_tree
  - recursion
  - iteration
---
![[problems/pictures/Pasted image 20240908023916.png]]![[problems/pictures/Pasted image 20240908023931.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
public:  
  bool isValidBST(TreeNode *root) {  
    TreeNode *prev = nullptr;  
    std::stack<TreeNode *> stk;  
  
    while (root || !stk.empty()) {  
      while (root) {  
        stk.push(root);  
        root = root->left;  
      }  
      root = stk.top();  
      stk.pop();  
  
      if (prev && root->val <= prev->val) {  
        return false;  
      }  
  
      prev = root;  
      root = root->right;  
    }  
  
    return true;  
  }  
};
```


```c++
class Solution_Recursion {  
  
  bool helper(TreeNode *root, int min, int max) {  
    return !root || (min < root->val && max > root->val &&  
                     helper(root->left, min, root->val) &&  
                     helper(root->right, root->val, max));  
  }  
  
public:  
  bool isValidBST(TreeNode *root) {  
    return helper(root, std::numeric_limits<int>::min(),  
                  std::numeric_limits<int>::max());  
  }  
};
```