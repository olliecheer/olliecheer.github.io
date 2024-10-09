---
tags:
- dfs
- bfs
---
![[pictures/Pasted image 20240924213638.png]]![[pictures/Pasted image 20240924213649.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int depthSum(vec<NestedInteger> &nestedList) { return dfs(nestedList, 1); }

  int dfs(vec<NestedInteger> &list, int depth) {
    int total = 0;
    for (auto &nested : list) {
      if (nested.isInteger()) {
        total += nested.getInteger() * depth;
      } else {
        total += dfs(nested.getList(), depth + 1);
      }
    }
    return total;
  }
};
```