---
tags:
---

![[problems/pictures/Pasted image 20240909221645.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int binary_guess(vec<int> const &nums, int K, int low, int high) {
    int mid = 0;
    while (low <= high) {
      mid = low + (high - low) / 2;
      if (validate(nums, K, mid))
        high = mid - 1;
      else
        low = mid + 1;
    }

    return low;
  }

  bool validate(vec<int> const &nums, int K, int subArraySum) {
    int cur_sum = 0, count = 1;
    for (int it : nums) {
      cur_sum += it;
      if (cur_sum > subArraySum) {
        cur_sum = it;
        count++;
        if (count > K)
          return false;
      }
    }
    return true;
  }

public:
  int splitArray(vec<int> const &nums, int K) {
    int sum = std::accumulate(nums.begin(), nums.end(), 0);
    int max = *std::max_element(nums.begin(), nums.end());
    return binary_guess(nums, K, max, sum);
  }
};
```
