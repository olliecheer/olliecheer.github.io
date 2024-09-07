---
tags:
  - binary_tree
  - tree_construct
  - inorder
  - postorder
---
![[problems/pictures/Pasted image 20240908024711.png]]
![[problems/pictures/Pasted image 20240908024721.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Solution {  
  vec<int> inorder, postorder;  
  int N;  
  std::unordered_map<int, int> mp;  
  
  TreeNode *helper(int in_start, int in_end, int post_start, int post_end) {  
    if (in_start > in_end)  
      return nullptr;  
  
    auto root = new TreeNode{postorder[post_end]};  
    int in_index = mp[root->val];  
    int right_tree_sz = in_end - in_index;  
    root->left = helper(in_start, in_index - 1, post_start,  
                        post_end - right_tree_sz - 1);  
    root->right =  
        helper(in_start + 1, in_end, post_end - right_tree_sz, post_end - 1);  
    return root;  
  }  
  
public:  
  TreeNode *buildTree(vec<int> &inorder, vec<int> &postorder) {  
    this->inorder = std::move(inorder);  
    this->postorder = std::move(postorder);  
    int N = inorder.size();  
  
    for (int i = 0; i < N; i++)  
      mp[inorder[i]] = i;  
  
    return helper(0, N - 1, 0, N - 1);  
  }  
};
```