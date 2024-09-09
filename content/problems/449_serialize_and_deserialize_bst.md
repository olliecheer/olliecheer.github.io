---
tags:
---
![[problems/pictures/Pasted image 20240909222726.png]]

```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
using namespace std::string_literals;  
  
class Solution {  
  TreeNode *do_deserialize(std::queue<std::string> &q, int lower, int upper) {  
    if (q.empty())  
      return nullptr;  
  
    int val = std::stoi(q.front());  
    if (val < lower || val > upper)  
      return nullptr;  
    q.pop();  
  
    auto root = new TreeNode{val};  
    root->left = do_deserialize(q, lower, val);  
    root->right = do_deserialize(q, val, upper);  
    return root;  
  }  
  
public:  
  std::string serialize(TreeNode *root) {  
    if (!root)  
      return "";  
    std::string res = std::to_string(root->val);  
    if (root->left)  
      res += ","s + serialize(root->left);  
    if (root->right)  
      res += ","s + serialize(root->right);  
  
    return res;  
  }  
  
  TreeNode *deserilize(std::string &data) {  
    if (data.empty())  
      return nullptr;  
  
    std::queue<std::string> q;  
  
    std::stringstream ss;  
    std::string tmp;  
    while (std::getline(ss, tmp, ','))  
      q.push(std::move(tmp));  
  
    return do_deserialize(q, std::numeric_limits<int>::min(),  
                          std::numeric_limits<int>::max());  
  }  
  
private:  
  int i = 0;  
  
  TreeNode *do_deserialize_v2(vec<int> &A, int upper_bound) {  
    if (i == A.size() || A[i] > upper_bound)  
      return nullptr;  
  
    auto root = new TreeNode{A[i]};  
    i++;  
    root->left = do_deserialize_v2(A, root->val);  
    root->right = do_deserialize_v2(A, upper_bound);  
    return root;  
  }  
  
public:  
  TreeNode *deserialize_v2(std::string &data) {  
    if (data.empty())  
      return nullptr;  
  
    vec<int> nums;  
  
    std::stringstream ss;  
    std::string tmp;  
    while (std::getline(ss, tmp, ','))  
      nums.push_back(std::stoi(tmp));  
  
    return do_deserialize_v2(nums, std::numeric_limits<int>::max());  
  }  
};
```