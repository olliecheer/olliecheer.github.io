---
tags:
  - path
  - graph
---
![[problems/pictures/Pasted image 20240910020905.png]]
![[problems/pictures/Pasted image 20240910020915.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool validPath(int n, vec<vec<int>> edges, int start, int end) {
    std::unordered_map<int, vec<int>> mp;
    for (auto &e : edges) {
      mp[e[0]].push_back(e[1]);
      mp[e[1]].push_back(e[0]);
    }

    std::unordered_set<int> visited;
    std::queue<int> q;
    q.push(start);
    visited.insert(start);

    while (!q.empty()) {
      int cur = q.front();
      q.pop();
      if (cur == end)
        return true;

      for (int i : mp[cur])
        if (visited.count(i) == 0) {
          visited.insert(i);
          q.push(i);
        }
    }

    return false;
  }
};
```