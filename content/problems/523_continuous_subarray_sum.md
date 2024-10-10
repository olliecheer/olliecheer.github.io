---
tags:
  - subarray
  - sum
---
![[pictures/Pasted image 20241010213509.png]]
![[pictures/Pasted image 20241010213522.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool checkSubarraySum(vec<int> nums, int k) {
    int M = nums.size();
    if (M < 2)
      return false;

    std::unordered_map<int, int> mp;
    mp[0] = -1;
    int remainder = 0;
    for (int i = 0; i < M; i++) {
      remainder = (remainder + nums[i]) % k;
      if (mp.count(remainder)) {
        if (i - mp[remainder] >= 2)
          return true;
      } else
        mp[remainder] = i;
    }

    return false;
  }
};
```

