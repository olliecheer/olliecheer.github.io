---
tags:
  - divide_and_conquer
  - greedy
  - subarray
---
![[problems/pictures/Pasted image 20241012200328.png]]
![[problems/pictures/Pasted image 20241012200342.png]]


## Greedy

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maxSubArray(vec<int> &nums) {
    int sum = 0, res = INT_MIN;
    for (int i = 0; i < nums.size(); i++) {
      sum = std::max(sum + nums[i], nums[i]);
      res = std::max(sum, res);
    }
    return res;
  }
};
```

## Kadane Algorithm

```c++
class Solution_kadane_algo {  
public:  
  int maxSubArray(vec<int> nums) {  
    int N = nums.size();  
    int res = INT_MIN;  
  
    for (int i = 0, cur_sum = 0; i < N; i++) {  
      cur_sum += nums[i];  
      res = std::max(cur_sum, res);  
      cur_sum = std::max(cur_sum, 0);
    }  
  
    return res;  
  }  
};
```



## Divide and Conquer

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int conquer(vec<int> &nums, int left, int mid, int right) {
    int left_sum = 0, left_max = INT_MIN;
    for (int i = mid; i >= left; i--) {
      left_sum += nums[i];
      left_max = std::max(left_max, left_sum);
    }

    int right_sum = 0, right_max = INT_MIN;
    for (int i = mid + 1; i <= right; i++) {
      right_sum += nums[i];
      right_max = std::max(right_max, right_sum);
    }
    return left_max + right_max;
  }

  int divide(vec<int> &nums, int left, int right) {
    if (left == right)
      return nums[left];

    int mid = left + (right - left) / 2;
    int left_max_sum = divide(nums, left, mid);
    int right_max_sum = divide(nums, mid + 1, right);
    int cross_max_sum = conquer(nums, left, mid, right);

    return std::max({left_max_sum, right_max_sum, cross_max_sum});
  }

public:
  int maxSubArray(vec<int> nums) { return divide(nums, 0, nums.size() - 1); }
};
```

