---
tags:
  - island
  - dfs
---
![[problems/pictures/Pasted image 20241011085021.png]]
![[problems/pictures/Pasted image 20241011085030.png]]
![[problems/pictures/Pasted image 20241011085042.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void dfs(vec<vec<int>> &grid, int i, int j, std::string &s, std::string dir) {
    if (i < 0 || i >= grid.size() || j < 0 || j >= grid[0].size() ||
        grid[i][j] == 0)
      return;

    s += dir;
    grid[i][j] = 0;
    dfs(grid, i - 1, j, s, "u");
    dfs(grid, i + 1, j, s, "d");
    dfs(grid, i, j - 1, s, "l");
    dfs(grid, i, j + 1, s, "r");
    s += "#end";
  }

public:
  int numDistinctIslands(vec<vec<int>> &grid) {
    std::unordered_set<std::string> st;
    for (int i = 0; i < grid.size(); i++)
      for (int j = 0; j < grid[0].size(); j++)
        if (grid[i][j] != 0) {
          std::string s;
          dfs(grid, i, j, s, "start#");
          st.insert(std::move(s));
        }

    return st.size();
  }
};
```
