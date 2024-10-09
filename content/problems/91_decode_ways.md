---
tags:
  - dfs
  - memo
---


![[problems/pictures/Pasted image 20240908023124.png]]
![[problems/pictures/Pasted image 20240908023136.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  bool validTwoDigits(std::string &s, int i) {
    return i + 1 < s.size() && (s[i] == '1' || (s[i] == '2' && s[i + 1] < '7'));
  }

  int dfs(std::string &s, int i, vec<int> &memo) {
    if (i == s.size())
      return 1;

    if (memo[i] > 0)
      return memo[i];

    if (s[i] == '0')
      memo[i] = 0;
    else if (validTwoDigits(s, i))
      memo[i] = dfs(s, i + 1, memo) + dfs(s, i + 2, memo);
    else
      memo[i] = dfs(s, i + 1, memo);

    return memo[i];
  }

public:
  int numDecodings(std::string s) {
    if (s.empty() || s[0] == '0')
      return 0;

    vec<int> memo(s.size() + 1);
    return dfs(s, 0, memo);
  }
};
```