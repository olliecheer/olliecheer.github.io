---
tags:
  - subarray
  - median
---
![[pictures/Pasted image 20241013230347.png]]
![[pictures/Pasted image 20241013230401.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int countSubarrays(vec<int> &nums, int k) {
    int N = nums.size();
    int kIndex = -1;
    for (int i = 0; i < N; i++)
      if (nums[i] == k) {
        kIndex = i;
        break;
      }

    int res = 0;
    std::unordered_map<int, int> counts;
    counts[0] = 1;
    int sum = 0;
    for (int i = 0; i < N; i++) {
      if (nums[i] > k)
        sum++;
      else if (nums[i] < k)
        sum--;

      if (i < kIndex)
        counts[sum]++;
      else
        res += counts[sum] + counts[sum - 1];
    }

    return res;
  }
};
```