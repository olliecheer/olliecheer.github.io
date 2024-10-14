---
tags:
  - sum
---
![[problems/pictures/Pasted image 20241014003640.png]]
![[problems/pictures/Pasted image 20241014003651.png]]


## Segment Tree

```c++
template <typename T> using vec = std::vector<T>;

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

class NumArray {
  SegmentTree st;

public:
  explicit NumArray(vec<int> &nums) : st(nums) {}

  void update(int i, int val) { st.update(i, val); }

  int sumRange(int i, int j) { return st.sum_range(i, j); }
};
```


## Binary Indexed Tree

```c++
template <typename T> using vec = std::vector<T>;

class NumArray{
  class BIT {
    vec<int> parent;

  public:
    explicit BIT(vec<int> &input) {
      int N = input.size();
      parent = vec<int>(N + 1);
      for (int i = 0; i < N; i++)
        update(i, input[i]);
    }

    int sum(int x) {
      int res = 0;
      x++;
      for (; x > 0; x -= (x & -x))
        res += parent[x];

      return res;
    }

    void update(int x, int val) {
      x++;
      for (; x < parent.size(); x += (x & -x))
        parent[x] += val;
    }
  };

  BIT bit;
  vec<int> nums;

public:
  explicit NumArray(vec<int> nums) : bit(nums) {
    this->nums = std::move(nums);
  }

  int sumRange(int i, int j) { return bit.sum(j) - bit.sum(i - 1); }

  void update(int i, int val) {
    int diff = val - nums[i];
    nums[i] = val;
    bit.update(i, diff);
  }
};
```