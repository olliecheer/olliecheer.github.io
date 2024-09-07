---
tags:
  - sum
---

![[problems/pictures/Pasted image 20240907193255.png]]

```c++
class Solution {  
public:  
  vec<vec<int>> threeSum(vec<int> &nums) {  
    std::sort(nums.begin(), nums.end());  
    vec<vec<int>> res;  
  
    for (int i = 0; i + 2 < nums.size(); i++) {  
      if (i > 0 && nums[i] == nums[i - 1]) {  
        continue;  
      }  
  
      int target = -nums[i];  
      int k = nums.size() - 2;  
      for (int j = i + 1; j + 1 < nums.size(); j++) {  
        if (j > i + 1 && nums[j] == nums[j - 1]) {  
          continue;  
        }  
  
        while (j < k && nums[j] + nums[k] > target) {  
          k--;  
        }  
        if (j == k) {  
          break;  
        }  
  
        if (nums[j] + nums[k] == target) {  
          res.push_back({nums[i], nums[j], nums[k]});  
        }  
      }  
    }  
  
    return res;  
  }  
};
```