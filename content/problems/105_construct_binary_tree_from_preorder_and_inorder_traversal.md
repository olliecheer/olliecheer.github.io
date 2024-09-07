---
tags:
  - binary_tree
  - preorder
  - inorder
  - tree_construct
---

![[problems/pictures/Pasted image 20240908024449.png]]![[problems/pictures/Pasted image 20240908024531.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution_O_n2 {  
  vec<int> preorder, inorder;  
  int N = 0;  
  
  TreeNode *helper(int pre_start, int in_start, int in_end) {  
    if (in_start > in_end) {  
      return nullptr;  
    }  
  
    auto node = new TreeNode{preorder[pre_start]};  
    int in_index = 0;  
  
    for (int i = in_start; i <= in_end; i++) {  
      if (inorder[i] == node->val) {  
        in_index = i;  
      }  
    }  
  
    int left_tree_size = in_index - in_start;  
    node->left = helper(pre_start + 1, in_start, in_index - 1);  
    node->right = helper(pre_start + 1 + left_tree_size, in_index + 1, in_end);  
    return node;  
  }  
  
public:  
  TreeNode *buildTree(vec<int> preorder, vec<int> inorder) {  
    this->preorder = std::move(preorder);  
    this->inorder = std::move(inorder);  
    this->N = this->preorder.size();  
    return helper(0, 0, N - 1);  
  }  
};
```


```c++
class Solution_O_n {  
  vec<int> preorder, inorder;  
  int preorder_index;  
  std::unordered_map<int, int> mp;  
  
  TreeNode *helper(int in_start, int in_end) {  
    if (in_start > in_end) {  
      return nullptr;  
    }  
  
    auto node = new TreeNode{preorder[preorder_index]};  
    preorder_index++;  
  
    int index = mp[node->val];  
  
    node->left = helper(in_start, index - 1);  
    node->right = helper(index + 1, in_end);  
    return node;  
  }  
  
public:  
  TreeNode *buildTree(vec<int> preorder, vec<int> inorder) {  
    this->preorder = std::move(preorder);  
    this->inorder = std::move(inorder);  
    this->preorder_index = 0;  
    int N = preorder.size();  
  
    for (int i = 0; i < N; i++) {  
      mp.insert({inorder[i], i});  
    }  
  
    return helper(0, N - 1);  
  }  
};
```