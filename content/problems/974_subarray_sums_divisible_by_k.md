---
tags:
  - subarray
  - sum
---
![[pictures/Pasted image 20241013202104.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int subarraysDivByK(vec<int> &A, int K) {
    std::unordered_map<int, int> count;
    count[0] = 1;
    int prefix = 0, res = 0;
    for (int a : A) {
      prefix = (prefix + a % K + K) % K;
      res += count[prefix];
      count[prefix]++;
    }

    return res;
  }
};
```