---
tags:
  - binary_search
---

![[problems/pictures/Pasted image 20240908225608.png]]

```c++
class Solution {
  // The API isBadVersion is defined for you.
  // bool isBadVersion(int version);

public:
  int firstBadVersion(int n) {
    int left = 1, right = n;
    while (left <= right) {
      int mid = left + (right - left) / 2;
      if (!isBadVersion(mid))
        left = mid + 1;
      else
        right = mid - 1;
    }
    return left;
  }
};
```