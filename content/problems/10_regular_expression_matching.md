---
tags:
  - dfs
  - regular_expression
  - recursion
---
![[pictures/Pasted image 20241012194910.png]]
![[pictures/Pasted image 20241012194921.png]]

### DFS
```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<vec<std::optional<bool>>> memo;

  bool dfs(std::string &s, std::string &p, int i, int j) {
    if (memo[i][j])
      return memo[i][j].value();

    bool res;
    if (j == p.size())
      res = (i == s.size());
    else {
      bool first_match = (i < s.size() && (p[j] == s[i] || p[j] == '.'));
      if (j + 1 < p.size() && p[j + 1] == '*') {
        bool star_match_null = dfs(s, p, i, j + 2);
        bool star_match_str = first_match && dfs(s, p, i + 1, j);
        res = star_match_null || star_match_str;
      } else
        res = first_match && dfs(s, p, i + 1, j + 1);
    }

    memo[i][j] = res;
    return res;
  }

public:
  bool isMatch(std::string s, std::string p) {
    memo = vec<vec<std::optional<bool>>>(
        s.size() + 1, vec<std::optional<bool>>(p.size() + 1));
    return dfs(s, p, 0, 0);
  }
};
```
