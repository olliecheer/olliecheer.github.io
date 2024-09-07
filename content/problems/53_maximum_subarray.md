---
tags:
  - divide_and_conquer
  - greedy
  - array
---
![[problems/pictures/Pasted image 20240907233004.png]]


```c++
class Solution_kadane_algo {  
public:  
  int maxSubArray(vec<int> nums) {  
    int N = nums.size();  
    int res = std::numeric_limits<int>::min();  
  
    for (int i = 0, cur_sum = 0; i < N; i++) {  
      cur_sum += nums[i];  
      res = std::max(cur_sum, res);  
      if (cur_sum < 0)  
        cur_sum = 0;  
    }  
  
    return res;  
  }  
};
```


```c++
class Solution_divide_and_conquer {  
  int conquer(vec<int> &nums, int left, int mid, int right) {  
    int left_sum = 0, left_max = std::numeric_limits<int>::min();  
    for (int i = mid; i >= left; i--) {  
      left_sum += nums[i];  
      left_max = std::max(left_max, left_sum);  
    }  
  
    int right_sum = 0, right_max = std::numeric_limits<int>::min();  
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
  int maxSubArray(vec<int> nums) {
    return divide(nums, 0, nums.size() - 1);
  }  
};
```


```c++
class Solution_greedy {  
public:  
  int maxSubArray(vec<int> &nums) {  
    int sum = 0, res = std::numeric_limits<int>::min();  
    for (int i = 0; i < nums.size(); i++) {  
      sum = std::max(sum + nums[i], nums[i]);  
      res = std::max(sum, res);  
    }  
    return res;  
  }  
};
```