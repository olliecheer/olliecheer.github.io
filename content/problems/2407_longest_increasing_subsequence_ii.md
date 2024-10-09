---
tags:
  - subsequence
---

![[problems/pictures/Pasted image 20240910021605.png]]
![[problems/pictures/Pasted image 20240910021613.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  class SegmentTree {
    SegmentTree *left{}, *right{};
    int start{}, end{}, val{};

    void setup(SegmentTree *node, int start, int end) {
      if (start == end)
        return;

      int mid = start + (end - start) / 2;
      if (!node->left) {
        node->left = new SegmentTree(start, mid);
        node->right = new SegmentTree(mid + 1, end);
      }

      setup(node->left, start, mid);
      setup(node->right, mid + 1, end);
      node->val = std::max(node->left->val, node->right->val);
    }

  public:
    SegmentTree(int start, int end) : start{start}, end{end} {
      setup(this, start, end);
    }

    void update(SegmentTree *node, int index, int val) {
      if (index < node->start || index > node->end)
        return;

      if (node->start == node->end && node->start == index) {
        node->val = val;
        return;
      }

      update(node->left, index, val);
      update(node->right, index, val);
      node->val = std::max(node->left->val, node->right->val);
    }

    int rangeMaxQuery(SegmentTree *node, int start, int end) {
      if (node->start > end || node->end < start)
        return 0;

      if (node->start >= start && node->end <= end)
        return node->val;

      return std::max(rangeMaxQuery(node->left, start, end),
                      rangeMaxQuery(node->right, start, end));
    }
  };

public:
  int lengthOfLIS(vec<int> &nums, int k) {
    SegmentTree *root = new SegmentTree{1, 100000};
    int res = 0;
    for (int n : nums) {
      int pre_max_len = root->rangeMaxQuery(root, n - k, n - 1);
      root->update(root, n, pre_max_len + 1);
      res = std::max(res, pre_max_len + 1);
    }

    return res;
  }
};
```