---
tags:
  - sum
  - dual_pointer
---
![[problems/pictures/Pasted image 20241012195052.png]]
![[problems/pictures/Pasted image 20241012195100.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int threeSumClosest(vec<int> &nums, int target) {
    std::sort(nums.begin(), nums.end());
    int N = nums.size();
    int res = nums[0] + nums[1] + nums[N - 1];

    for (int i = 0; i < N - 2; i++) {
      int left = i + 1, right = N - 1;
      while (left < right) {
        int sum = nums[i] + nums[left] + nums[right];
        if (std::abs(sum - target) < std::abs(res - target))
          res = sum;

        if (sum > target)
          right--;
        else
          left++;
      }
    }

    return res;
  }
};
```