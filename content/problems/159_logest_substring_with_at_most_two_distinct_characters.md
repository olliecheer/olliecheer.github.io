---
tags:
  - sliding_window
---
![[pictures/Pasted image 20241013234908.png]]



```c++
class Solution {
public:
  int lengthOfLongestSubstringTwoDistinct(std::string &s) {
    std::unordered_map<char, int> mp;
    int left = 0, res = 0;

    for (int i = 0; i < s.size(); i++) {
      char cur = s[i];
      mp[cur]++;
      while (mp.size() > 2) {
        char c = s[left];
        mp[c]--;
        if (mp[c] == 0)
          mp.erase(c);
        left++;
      }
      res = std::max(res, i - left + 1);
    }

    return res;
  }
};
```