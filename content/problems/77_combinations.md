---
tags:
  - combination
  - dfs
---
![[pictures/Pasted image 20241012201254.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void dfs(vec<vec<int>> &res, vec<int> &tmp, int n, int k, int idx) {
    if (tmp.size() == k)
      res.push_back(tmp);
    else {
      for (int i = idx; i <= n; i++) {
        tmp.push_back(i);
        dfs(res, tmp, n, k, i + 1);
        tmp.pop_back();
      }
    }
  }

public:
  vec<vec<int>> combine(int n, int k) {
    vec<vec<int>> res;
    vec<int> tmp;
    dfs(res, tmp, n, k, 1);
    return res;
  }
};
```
