---
tags:
  - sliding_window
---
![[problems/pictures/Pasted image 20241014000716.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool containsNearbyDuplicate(vec<int> &nums, int k) {
    std::unordered_set<int> window;
    int sz = nums.size();

    for (int i = 0; i < sz; i++) {
      if (i > k)
        window.erase(nums[i - k - 1]);

      if (window.count(nums[i]))
        return true;

      window.insert(nums[i]);
    }

    return false;
  }
};
```