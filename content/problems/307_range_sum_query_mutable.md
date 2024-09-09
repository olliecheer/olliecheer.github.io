---
tags:
  - sum
---
![[problems/pictures/Pasted image 20240909211532.png]]

```c++
class NumArray {  
  SegmentTree st;  
  
public:  
  explicit NumArray(vec<int> &nums) : st(nums) {}  
  
  void update(int i, int val) { st.update(i, val); }  
  
  int sumRange(int i, int j) { return st.sum_range(i, j); }  
};  
  
class NumArray_BIT {  
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
  explicit NumArray_BIT(vec<int> nums) : bit(nums) {  
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