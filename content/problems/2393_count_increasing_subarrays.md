---
tags:
  - array
---
![[problems/pictures/Pasted image 20240910021528.png]]


```c++
class Solution {  
public:  
  long countSubarrays(vec<int> &nums) {  
    long res = 0;  
    for (int i = 0, j = 0; i < nums.size(); i++) {  
      if (i > 0 && nums[i - 1] >= nums[i]) {  
        j = i;  
      }  
      res += i - j + 1;  
    }  
    return res;  
  }  
};
```


```c++
class Solution_2 {  
public:  
  long countSubarrays(vec<int> &nums) {  
    int N = nums.size();  
    vec<int> dp(N);  
    dp[0] = 1;  
  
    for (int i = 1; i < N; i++) {  
      if (nums[i] > nums[i - 1]) {  
        dp[i] += dp[i - 1];  
      }  
      dp[i]++;  
    }  
  
    long res = 0;  
    for (int i = 0; i < N; i++) {  
      res += dp[i];  
    }  
  
    return res;  
  }  
};
```


```c++
class Solution_3 {  
public:  
  long countSubarrays(vec<int> &nums) {  
    long res = 0;  
    int j = 0;  
    long len;  
    for (int i = 1; i < nums.size(); i++) {  
      if (nums[i] <= nums[i - 1]) {  
        len = i - j;  
        res += (len + 1) * len / 2;  
        j = i;  
      }  
    }  
    len = nums.size() - j;  
    res += (len + 1) * len / 2;  
    return res;  
  }  
};
```