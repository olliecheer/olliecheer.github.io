---
tags:
---
![[problems/pictures/Pasted image 20240909212300.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Node {
public:
  int start, end, sum{};
  Node *left{}, *right{};
  Node(int start, int end) : start{start}, end{end} {}
};

class SegmentTree {
  Node *root;
  static Node *buildTree(std::vector<int> const &nums, int start, int end) {
    if (start > end)
      return nullptr;

    auto node = new Node(start, end);
    if (start == end)
      node->sum = nums[start];
    else {
      int mid = start + (end - start) / 2;
      node->left = buildTree(nums, start, mid);
      node->right = buildTree(nums, mid + 1, end);
      node->sum = node->left->sum + node->right->sum;
    }
    return node;
  }
  static int floor_mid(int a, int b) {
    if (a > b)
      std::swap(a, b);

    return a + (b - a) / 2;
  }
  static void _update(Node *node, int i, int val) {
    if (node->start == node->end) {
      node->sum = val;
      return;
    }
    int mid = floor_mid(node->start, node->end);
    if (i <= mid)
      _update(node->left, i, val);
    else
      _update(node->right, i, val);

    node->sum = node->left->sum + node->right->sum;
  }
  static int _sumRange(Node *node, int start, int end) {
    if (start > end)
      return 0;

    if (node->start == start && node->end == end) // exact match
      return node->sum;

    int mid = floor_mid(node->start, node->end);

    if (end <= mid)
      return _sumRange(node->left, start, end);
    else if (start > mid)
      return _sumRange(node->right, start, end);
    else
      return _sumRange(node->left, start, mid) +
             _sumRange(node->right, mid + 1, end);
  }

public:
  explicit SegmentTree(std::vector<int> nums) {
    this->root = buildTree(nums, 0, nums.size() - 1);
  }
  void update(int i, int val) { return _update(root, i, val); }
  int sum_range(int start, int end) { return _sumRange(root, start, end); }
};

class Solution {
public:
  vec<int> countSmaller(vec<int> &nums) {
    vec<int> res;
    int N = nums.size();
    for (auto &it : nums)
      it += 10000;

    vec<int> exist(20001);

    SegmentTree st(vec<int>(20001));
    exist[nums[N - 1]]++;
    st.update(nums[N - 1], exist[nums[N - 1]]);
    res.push_back(0);

    for (int i = N - 2; i >= 0; i--) {
      exist[nums[i]]++;
      st.update(nums[i], exist[nums[i]]);
      res.push_back(st.sum_range(0, nums[i] - 1));
    }

    std::reverse(res.begin(), res.end());

    return res;
  }
};
```