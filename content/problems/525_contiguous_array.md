---
tags:
  - array
  - prefix_sum
---
![[problems/pictures/Pasted image 20240909224819.png]]


### Prefix Sum

```c++
// O(N)
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int findMaxLength(vec<int> &nums) {
    for (int &it : nums)
      if (it == 0)
        it = -1;

    int res = 0;
    int prefix_sum = 0;

    std::unordered_map<int, int> mp;
    mp[0] = -1;

    for (int i = 0; i < nums.size(); i++) {
      prefix_sum += nums[i];
      if (mp.count(prefix_sum))
        // We have seen this value before, which means ths range sum is zero.
        res = std::max(res, i - mp[prefix_sum]);
      else
        mp[prefix_sum] = i;
    }

    return res;
  }
};
```
