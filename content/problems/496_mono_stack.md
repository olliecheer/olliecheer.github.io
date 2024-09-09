---
tags:
  - mono_stack
---
![[problems/pictures/Pasted image 20240909224136.png]]


```c++
class Solution {  
public:  
  vec<int> nextGreaterElement(vec<int> &nums1, vec<int> &nums2) {  
    std::unordered_map<int, int> mp;  
    std::stack<int> stk;  
  
    for (int i = nums2.size() - 2; i >= 0; i--) {  
      while (!stk.empty() && nums2[i] >= stk.top())  
        stk.pop();  
  
      mp[nums2[i]] = (stk.empty() ? -1 : stk.top());  
      stk.push(nums2[i]);  
    }  
    vec<int> res;  
    for (auto it : nums1)  
      res.push_back(mp[it]);  
  
    return res;  
  }  
};
```