---
tags:
---

![[problems/pictures/Pasted image 20240908182245.png]]

```c++
class Solution {  
public:  
  int maximumGap(vec<int> &nums) {  
    if (nums.size() < 2)  
      return 0;  
  
    int max_val = *std::max_element(nums.begin(), nums.end());  
    int exp = 1;  
    int R = 10;  
    vec<int> aux(nums.size());  
  
    while (max_val / exp > 0) {  
      vec<int> count(R);  
  
      for (int i = 0; i < nums.size(); i++)  
        count[(nums[i] / exp) % 10]++;  
  
      for (int i = 1; i < count.size(); i++)  
        count[i] += count[i - 1];  
  
      for (int i = nums.size() - 1; i >= 0; i--) {  
        int k = (nums[i] / exp) % 10;  
        count[k]--;  
        aux[count[k]] = nums[i];  
      }  
  
      for (int i = 0; i < nums.size(); i++)  
        nums[i] = aux[i];  
  
      exp *= 10;  
    }  
  
    int res = 0;  
    for (int i = 1; i < aux.size(); i++)  
      res = std::max(res, aux[i] - aux[i - 1]);  
  
    return res;  
  }  
};
```