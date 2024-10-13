---
tags:
---
![[pictures/Pasted image 20241014010346.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

using namespace std::string_literals;

class Codec {
  TreeNode *do_deserialize(std::deque<std::string> &q, int lower, int upper) {
    if (q.empty())
      return nullptr;

    int val = std::stoi(q.front());
    if (val < lower || val > upper)
      return nullptr;

    q.pop_front();

    auto root = new TreeNode{val};
    root->left = do_deserialize(q, lower, val);
    root->right = do_deserialize(q, val, upper);
    return root;
  }

public:
  std::string serialize(TreeNode *root) {
    if (!root)
      return ""s;

    std::string res = std::to_string(root->val);
    if (root->left)
      res += ","s + serialize(root->left);
    if (root->right)
      res += ","s + serialize(root->right);

    return res;
  }

  TreeNode *deserialize(std::string &data) {
    if (data.empty())
      return nullptr;

    std::deque<std::string> q;
    std::stringstream ss(data);
    std::string tmp;
    while (std::getline(ss, tmp, ','))
      q.push_back(std::move(tmp));

    return do_deserialize(q, INT_MIN, INT_MAX);
  }
};
```



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

using namespace std::string_literals;

class Codec {
  int i = 0;
  TreeNode *do_deserialize(vec<int> &A, int upper_bound) {
    if (i == A.size() || A[i] > upper_bound)
      return nullptr;

    auto root = new TreeNode{A[i]};
    i++;
    root->left = do_deserialize(A, root->val);
    root->right = do_deserialize(A, upper_bound);
    return root;
  }

public:
  std::string serialize(TreeNode *root) {
    if (!root)
      return ""s;

    std::string res = std::to_string(root->val);
    if (root->left)
      res += ","s + serialize(root->left);
    if (root->right)
      res += ","s + serialize(root->right);

    return res;
  }

  TreeNode *deserialize(std::string &data) {
    if (data.empty())
      return nullptr;

    vec<int> nums;

    std::stringstream ss(data);
    std::string tmp;
    while (std::getline(ss, tmp, ','))
      nums.push_back(std::stoi(tmp));

    return do_deserialize(nums, std::numeric_limits<int>::max());
  }
};
```