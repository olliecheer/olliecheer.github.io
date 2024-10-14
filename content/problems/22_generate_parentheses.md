---
tags:
  - parentheses
  - combination
  - dfs
  - backtrack
---
![[problems/pictures/Pasted image 20241012195401.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void backtrack(vec<std::string> &res, std::string &tmp, int open, int close,
                 int max) {
    if (tmp.size() == max * 2) {
      res.push_back(tmp);
      return;
    }
    if (open < max) {
      tmp.push_back('(');
      backtrack(res, tmp, open + 1, close, max);
      tmp.pop_back();
    }
    if (close < open) {
      tmp.push_back(')');
      backtrack(res, tmp, open, close + 1, max);
      tmp.pop_back();
    }
  }

public:
  vec<std::string> generateParenthesis(int n) {
    vec<std::string> res;
    std::string tmp;
    backtrack(res, tmp, 0, 0, n);
    return res;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void dfs(int left, int right, std::string &tmp, vec<std::string> &res) {
    if (left > right)
      return;

    if (left == 0 && right == 0)
      res.push_back(tmp);

    if (left > 0) {
      tmp.push_back('(');
      dfs(left - 1, right, tmp, res);
      tmp.pop_back();
    }

    if (right > 0) {
      tmp.push_back(')');
      dfs(left, right - 1, tmp, res);
      tmp.pop_back();
    }
  }

public:
  vec<std::string> generateParenthesis(int n) {
    vec<std::string> res;
    std::string tmp;
    dfs(n, n, tmp, res);
    return res;
  }
};
```

