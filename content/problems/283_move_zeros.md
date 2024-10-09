---
tags: []
---
![[problems/pictures/Pasted image 20240908225706.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  void moveZeroes(vec<int> &nums) {
    int left = 0, N = nums.size();
    for (int it : nums) {
      if (it != 0) {
        nums[left] = it;
        left++;
      }
    }

    for (; left < N; left++)
      nums[left] = 0;
  }
};
```