---
tags:
  - subsequence
---
![[problems/pictures/Pasted image 20240910020034.png]]

```c++
class Solution {  
    int lengthOfLIS(vec<int> &nums) {  
        vec<int> dp(nums.size());  
        int len = 0;  
        for (int x: nums) {  
            if (x == -1)  
                continue;  
  
            int i = std::binary_search(dp.begin(), dp.begin() + len, x);  
            if (i < 0)  
                i = -(i + 1);  
            dp[i] = x;  
            if (i == len)  
                len++;  
        }  
  
        return len;  
    }  
  
public:  
    int minOperations(vec<int> target, vec<int> arr) {  
        std::unordered_map<int, int> mp;  
        for (int i = 0; i < target.size(); i++)  
            mp[target[i]] = i;  
        vec<int> nums(arr.size());  
        for (int i = 0; i < arr.size(); i++) {  
            if (!mp.count(arr[i]))  
                nums[i] = -1;  
            else  
                nums[i] = mp[arr[i]];  
        }  
  
        return target.size() - lengthOfLIS(nums);  
    }  
};
```