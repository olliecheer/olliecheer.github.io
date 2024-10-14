---
tags:
  - palindrome
  - dfs
  - partition
  - backtrack
---
![[problems/pictures/Pasted image 20241013233809.png]]



## DFS

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  bool is_palindrome(std::string &s) {
    int i = 0, j = s.size() - 1;
    while (i < j) {
      if (s[i] != s[j])
        return false;

      i++;
      j--;
    }

    return true;
  }

  void dfs(std::string &s, int start, vec<std::string> &tmp,
           vec<vec<std::string>> &res) {
    if (start >= s.size()) {
      res.push_back({tmp});
      return;
    }

    for (int i = start; i < s.size(); i++) {
      auto substring = s.substr(start, i + 1 - start);
      if (is_palindrome(substring)) {
        tmp.push_back(substring);
        dfs(s, i + 1, tmp, res);
        tmp.pop_back();
      }
    }
  }

public:
  vec<vec<std::string>> partition(std::string &s) {
    vec<vec<std::string>> res;
    vec<std::string> tmp;
    dfs(s, 0, tmp, res);
    return res;
  }
};
```


## Pre-process

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  void backtrack(vec<vec<std::string>> &res, vec<std::string> &tmp,
                 vec<vec<bool>> &memo, std::string &s, int pos) {
    if (pos == s.size()) {
      res.push_back(tmp);
      return;
    }

    for (int i = pos; i < s.size(); i++) {
      if (memo[pos][i]) {
        tmp.push_back(s.substr(pos, i + 1 - pos));
        backtrack(res, tmp, memo, s, i + 1);
        tmp.pop_back();
      }
    }
  }

public:
  vec<vec<std::string>> partition(std::string &s) {
    vec<vec<std::string>> res;
    int N = s.size();
    vec<vec<bool>> memo(N, vec<bool>(N));
    for (int i = 0; i < N; i++)
      for (int j = 0; j <= i; j++)
        if (s[i] == s[j] && (i - j <= 2 || memo[j + 1][i - 1]))
          memo[j][i] = true;

    vec<std::string> tmp;
    backtrack(res, tmp, memo, s, 0);
    return res;
  }
};
```


