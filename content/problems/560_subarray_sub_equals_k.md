---
tags: []
---
![[problems/pictures/Pasted image 20240909225651.png]]

```c++
// prefix sum  
// T(n) = O(N^2)  
class Solution_prefix_sum {  
public:  
  int subarraySum(vec<int> &nums, int k) {  
    int count = 0;  
    vec<int> prefix_sum(nums.size() + 1);  
    prefix_sum[0] = 0;  
    for (int i = 1; i <= prefix_sum.size(); i++)  
      prefix_sum[i] = prefix_sum[i - 1] + nums[i - 1];  
  
    for (int start = 0; start < nums.size(); start++) {  
      for (int end = start + 1; end <= nums.size(); end++) {  
        if (prefix_sum[end] - prefix_sum[start] == k)  
          count++;  
      }  
    }  
  
    return count;  
  }  
};
```


```c++
// O(n)  
class Solution {  
public:  
  int subarraySum(vec<int> &nums, int k) {  
    std::unordered_map<int, int> mp;  
    int sum = 0, res = 0;  
    mp.insert({0, 1});  
    for (int n : nums) {  
      sum += n;  
      if (mp.count(sum - k))  
        res += mp[sum - k];  
  
      mp.insert({sum, mp[sum] + 1});  
    }  
  
    return res;  
  }  
};
```