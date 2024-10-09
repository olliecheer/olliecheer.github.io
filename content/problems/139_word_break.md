---
tags:
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240908031828.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool wordBreak(std::string s, vec<std::string> wordDict) {
    int N = s.size();
    vec<bool> dp(N + 1);
    dp[0] = true;
    std::set<std::string> st(wordDict.begin(), wordDict.end());
    for (int i = 1; i <= N; i++)
      for (int j = 0; j < i; j++)
        if (dp[j] && st.count(s.substr(j, i - j)))
          dp[i] = true;

    return dp[N];
  }
};
```