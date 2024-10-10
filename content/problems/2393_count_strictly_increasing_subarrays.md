---
tags:
  - subarray
  - dp_array
  - sliding_window
---
![[pictures/Pasted image 20241009212220.png]]
![[pictures/Pasted image 20241009212233.png]]

### Sliding Window

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  long countSubarrays(vec<int> &nums) {
    long res = 0;
    for (int i = 0, j = 0; i < nums.size(); i++) {
      if (i > 0 && nums[i - 1] >= nums[i])
        j = i;

      res += i - j + 1;
    }
    return res;
  }
};
```


### DP Array
```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  long countSubarrays(vec<int> &nums) {
    int N = nums.size();
    vec<int> dp(N);
    dp[0] = 1;

    for (int i = 1; i < N; i++) {
      if (nums[i] > nums[i - 1])
        dp[i] += dp[i - 1];

      dp[i]++;
    }

    long res = 0;
    for (int i = 0; i < N; i++)
      res += dp[i];

    return res;
  }
};
```
