---
tags:
  - binary_tree
  - postorder
  - preorder
  - tree_construct
---
![[problems/pictures/Pasted image 20240910002106.png]]
![[problems/pictures/Pasted image 20240910002114.png]]

```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  std::unordered_map<int, int> post_map;
  vec<int> pre, post;
  int pre_start = 0;
  int N;

  TreeNode *helper(int post_start, int post_end) {
    if (pre_start >= N || post_start > post_end)
      return nullptr;

    auto root = new TreeNode{pre[pre_start]};
    pre_start++;
    if (pre_start == N || post_start == post_end)
      return root;

    int post_idx = post_map[pre[pre_start]];
    root->left = helper(post_start, post_idx);
    root->right = helper(post_idx + 1, post_end - 1);

    return root;
  }

public:
  TreeNode *constructFromPrePost(vec<int> &pre, vec<int> &post) {
    N = pre.size();
    this->pre = std::move(pre);
    this->post = std::move(post);

    for (int i = 0; i < N; i++)
      post_map[this->post[i]] = i;

    return helper(0, N - 1);
  }
};
```