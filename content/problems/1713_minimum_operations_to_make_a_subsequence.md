---
tags:
  - subsequence
---
![[problems/pictures/Pasted image 20240910020034.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minOperations(vec<int> &target, vec<int> &arr) {
    int n = target.size();
    std::unordered_map<int, int> pos;
    for (int i = 0; i < n; ++i)
      pos[target[i]] = i;

    vec<int> d;
    for (int val : arr)
      if (pos.count(val)) {
        int idx = pos[val];
        auto it = std::lower_bound(d.begin(), d.end(), idx);
        if (it != d.end())
          *it = idx;
        else
          d.push_back(idx);
      }

    return n - d.size();
  }
};
```