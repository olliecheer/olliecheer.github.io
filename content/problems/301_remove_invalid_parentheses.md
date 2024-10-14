---
tags:
  - parentheses
---
![[problems/pictures/Pasted image 20241014003207.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void dfs(std::string &s, int i, std::unordered_set<std::string> &res,
           std::string &tmp, int left_to_remove, int right_to_remove,
           int open) {
    if (left_to_remove < 0 || right_to_remove < 0 || open < 0)
      return;

    if (i == s.size()) {
      if (left_to_remove == 0 && right_to_remove == 0 && open == 0)
        res.insert(tmp);

      return;
    }
    char c = s[i];
    int len = tmp.size();
    if (c == '(') {
      dfs(s, i + 1, res, tmp, left_to_remove - 1, right_to_remove, open);
      tmp.push_back(c);
      dfs(s, i + 1, res, tmp, left_to_remove, right_to_remove, open + 1);
    } else if (c == ')') {
      dfs(s, i + 1, res, tmp, left_to_remove, right_to_remove - 1, open);
      tmp.push_back(c);
      dfs(s, i + 1, res, tmp, left_to_remove, right_to_remove, open - 1);
    } else {
      tmp.push_back(c);
      dfs(s, i + 1, res, tmp, left_to_remove, right_to_remove, open);
    }

    tmp.resize(len);
  }

public:
  vec<std::string> removeInvalidParentheses(std::string &s) {
    int left_to_remove = 0, right_to_remove = 0;
    for (char c : s) {
      if (c == '(')
        left_to_remove++;
      else if (c == ')') {
        if (left_to_remove != 0)
          left_to_remove--;
        else
          right_to_remove++;
      }
    }

    std::unordered_set<std::string> res;
    std::string tmp;
    dfs(s, 0, res, tmp, left_to_remove, right_to_remove, 0);

    return {res.begin(), res.end()};
  }
};
```