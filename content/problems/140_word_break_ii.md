---
tags:
  - dynamic_programming
  - word_break
---
![[problems/pictures/Pasted image 20241013234201.png]]
![[problems/pictures/Pasted image 20241013234209.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<std::string> res;

  void strip(std::string &s) {
    while (s.back() == ' ')
      s.pop_back();

    int i = 0;
    for (; i < s.size() && s[i] == ' '; i++)
      ;

    s = s.substr(i);
  }

  void getResult(vec<vec<int>> &dp, std::string cur, int index,
                 std::string &str) {
    if (index == 0) {
      strip(cur);
      res.push_back(cur);
      return;
    }

    for (int prev_index : dp[index])
      getResult(dp, str.substr(prev_index, index - prev_index) + " " + cur,
                prev_index, str);
  }

public:
  vec<std::string> wordBreak(std::string &s, vec<std::string> &wordDict) {
    int N = s.size();
    vec<vec<int>> dp(N + 1);
    dp[0].push_back(0);

    std::unordered_set<std::string> wordSet(wordDict.begin(), wordDict.end());
    for (int i = 1; i <= N; i++)
      for (int j = 0; j < i; j++)
        if (!dp[j].empty() && wordSet.count(s.substr(j, i - j)))
          dp[i].push_back(j);

    getResult(dp, "", N, s);
    return res;
  }
};
```