---
tags:
---
![[pictures/Pasted image 20241013235051.png]]


## Radix sort

```c++
template <typename T> using vec = std::vector<T>;

class Solution {

  // T(n) = O(n)
  void radix_sort(vec<int> &nums) {
    int max_val = *std::max_element(nums.begin(), nums.end());
    int exp = 1;
    vec<int> tmp(nums.size());

    while (max_val / exp > 0) {
      vec<int> count(10);

      for (int it : nums)
        count[(it / exp) % 10]++;

      // prefix sum
      for (int i = 1; i < count.size(); i++)
        count[i] += count[i - 1];

      for (int i = nums.size() - 1; i >= 0; i--) {
        int k = (nums[i] / exp) % 10;
        count[k]--;
        tmp[count[k]] = nums[i];
      }

      for (int i = 0; i < nums.size(); i++)
        nums[i] = tmp[i];

      exp *= 10;
    }

    nums = std::move(tmp);
  }

public:
  int maximumGap(vec<int> &nums) {
    if (nums.size() < 2)
      return 0;

    radix_sort(nums);

    int res = 0;
    for (int i = 1; i < nums.size(); i++)
      res = std::max(res, nums[i] - nums[i - 1]);

    return res;
  }
};
```