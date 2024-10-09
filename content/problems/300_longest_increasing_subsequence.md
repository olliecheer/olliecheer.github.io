---
tags:
  - subsequence
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240908230124.png]]


## Dynamic Programming

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int lengthOfLIS(vec<int> const &nums) {
    if (nums.empty())
      return 0;

    vec<int> dp(nums.size(), 1);

    int res = 1;
    for (int i = 1; i < nums.size(); i++) {
      for (int j = 0; j < i; j++) {
        if (nums[j] < nums[i])
          dp[i] = std::max(dp[j] + 1, dp[i]);

        res = std::max(res, dp[i]);
      }
    }

    return res;
  }
};
```


## Construct

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int binary_search_first_greater_equal(vec<int> const &nums, int target) {
    int left = 0, right = nums.size() - 1;
    while (left <= right) {
      int mid = left + (right - left) / 2;
      if (nums[mid] >= target)
        right = mid - 1;
      else if (nums[mid] < target)
        left = mid + 1;
      else
        return mid;
    }

    return left;
  }

public:
  int lengthOfLIS(vec<int> const &nums) {
    vec<int> sub;
    sub.push_back(nums[0]);
    for (int i = 1; i < nums.size(); i++) {
      int num = nums[i];
      if (num > sub.back())
        sub.push_back(num);
      else {
        int j = binary_search_first_greater_equal(sub, num);
        sub[j] = num;
      }
    }

    return sub.size();
  }
};
```