---
tags:
  - dynamic_programming
  - word_break
---


![[problems/pictures/Pasted image 20240908031912.png]]

```c++
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
      getResult(dp, str.substr(prev_index, index - prev_index + 1) + " " + cur,  
                prev_index, str);  
  }  
  
public:  
  vec<std::string> wordBreak(std::string &s, vec<std::string> &wordDict) {  
    vec<vec<int>> dp(s.size() + 1);  
    dp[0].push_back(0);  
  
    std::unordered_set<std::string> wordSet(wordDict.begin(), wordDict.end());  
    for (int i = 1; i <= s.size(); i++) {  
      for (int j = 0; j < i; j++) {  
        if (!dp[j].empty() && wordSet.count(s.substr(j, i - j + 1)))  
          dp[i].push_back(i);  
      }  
    }  
  
    getResult(dp, "", s.size(), s);  
    return res;  
  }  
};
```