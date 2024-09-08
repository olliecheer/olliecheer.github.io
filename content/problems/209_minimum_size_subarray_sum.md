---
tags:
  - subarray
  - guess
---
![[problems/pictures/Pasted image 20240908185221.png]]

```c++
class Solution_guess {  
  bool validWindow(vec<int> const &nums, int s, int size) {  
    int sum = 0;  
    for (int i = 0; i < nums.size(); i++) {  
      sum += nums[i];  
      if (i - size >= 0)  
        sum -= nums[i - size];  
  
      if (sum >= s)  
        return true;  
    }  
  
    return false;  
  }  
  
public:  
  int minSubArrayLen(int s, vec<int> nums) {  
    int i = 1, j = nums.size();  
    int res = 0;  
  
    while (i <= j) {  
      int mid = i + (j - i) / 2;  
      if (validWindow(nums, s, mid)) {  
        j = mid - 1;  
        res = mid;  
      } else {  
        i = mid + 1;  
      }  
    }  
  
    return res;  
  }  
};
```


```c++
class Solution {  
public:  
  int minSubArrayLen(vec<int> &nums, int target) {  
    int left = 0, N = nums.size();  
    int res = std::numeric_limits<int>::max();  
    int sum = 0;  
  
    for (int i = 0; i < N; i++) {  
      sum += nums[i];  
      while (sum >= target) {  
        res = std::min(res, i - left + 1);  
        sum -= nums[left];  
        left--;  
      }  
    }  
    return res == std::numeric_limits<int>::max() ? 0 : res;  
  }  
};
```