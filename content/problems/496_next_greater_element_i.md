---
tags:
  - mono_stack
---
![[problems/pictures/Pasted image 20241014011350.png]]
![[problems/pictures/Pasted image 20241014011358.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> nextGreaterElement(vec<int> &nums1, vec<int> &nums2) {
    std::unordered_map<int, int> mp;
    std::stack<int> stk;

    for (int n : nums2) {
      while (!stk.empty() && n > stk.top()) {
        mp[stk.top()] = n;
        stk.pop();
      }
      stk.push(n);
    }

    while (!stk.empty()) {
      mp[stk.top()] = -1;
      stk.pop();
    }

    vec<int> res;
    for (auto it : nums1)
      res.push_back(mp[it]);

    return res;
  }
};
```
