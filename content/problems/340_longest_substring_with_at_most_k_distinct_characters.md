---
tags:
  - sliding_window
---
![[pictures/Pasted image 20241014004514.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int lengthOfLongestSubstringKDistinct(std::string &s, int k) {
    vec<int> mp(128, 0);
    int size = 0;
    int left = 0;
    int res = 0;
    for (int i = 0; i < s.size(); i++) {
      char cur = s[i];
      mp[cur]++;
      if (mp[cur] == 1)
        size++;

      while (size > k) {
        char c = s[left];
        mp[c]--;
        if (mp[c] == 0)
          size--;
        left++;
      }
      res = std::max(res, i - left + 1);
    }
    return res;
  }
};
```