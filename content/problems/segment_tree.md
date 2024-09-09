---
tags:
  - segment_tree
---

#### zkw segment tree
```c++
class SegmentTree {  
    std::vector<int> segtree;  
    int nr;  
public:  
    SegmentTree(std::vector<int> nums) {  
        nr = nums.size();  
        segtree.resize(2 * nr);  
        for (int i = nr; i < nr * 2; i++) {  
            segtree[i] = nums[i - nr];  
        }  
  
        for (int i = nr - 1; i > 0; i--) {  
            segtree[i] = segtree[2 * i] + segtree[2 * i + 1];  
        }  
    }  
  
    void update(int i, int val) {  
        int diff = val - segtree[i + nr];  
        for (i += nr; i > 0; i /= 2) {  
            segtree[i] += diff;  
        }  
    }  
  
    int sum_range(int left, int right) {  
        int res = 0;  
        for (left += nr, right += nr; left <= right; left /= 2, right /= 2) {  
            if (left % 2 == 1) {  
                res += segtree[left];  
                left++;  
            }  
            if (right % 2 == 0) {  
                res += segtree[right];  
                right--;  
            }  
        }  
        return res;  
    }  
};
```



#### tree based segment tree

```c++
class Node {  
public:  
    int start, end, sum{};  
    Node *left{}, *right{};  
    Node(int start, int end)  
            : start{start}, end{end} {}};  
  
  
class SegmentTree {  
    Node *root;  
    static Node *buildTree(std::vector<int> const &nums, int start, int end) {  
        if (start > end) {  
            return nullptr;  
        }  
        auto node = new Node(start, end);  
        if (start == end) {  
            node->sum = nums[start];        } else {  
            int mid = start + (end - start) / 2;  
            node->left = buildTree(nums, start, mid);            node->right = buildTree(nums, mid + 1, end);  
            node->sum = node->left->sum + node->right->sum;        }  
        return node;  
    }  
    static int floor_mid(int a, int b) {  
        if (a > b) {  
            std::swap(a, b);        }        return a + (b - a) / 2;  
    }  
    static void _update(Node *node, int i, int val) {  
        if (node->start == node->end) {  
            node->sum = val;            return;  
        }  
        int mid = floor_mid(node->start, node->end);  
        if (i <= mid) {  
            _update(node->left, i, val);        } else {  
            _update(node->right, i, val);        }  
        node->sum = node->left->sum + node->right->sum;    }  
    static int _sumRange(Node *node, int start, int end) {  
        if (start > end) {  
            return 0;  
        }  
        if (node->start == start && node->end == end) { // exact match  
            return node->sum;  
        }  
        int mid = floor_mid(node->start, node->end);  
  
        if (end <= mid) {  
            return _sumRange(node->left, start, end);  
        } else if (start > mid) {  
            return _sumRange(node->right, start, end);  
        } else {  
            return _sumRange(node->left, start, mid) + _sumRange(node->right, mid + 1, end);  
        }    }  
public:  
    explicit SegmentTree(std::vector<int> nums) {  
        this->root = buildTree(nums, 0, nums.size() - 1);  
    }  
    void update(int i, int val) {  
        return _update(root, i, val);  
    }  
    int sumRange(int start, int end) {  
        return _sumRange(root, start, end);  
    }};
```