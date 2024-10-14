---
tags:
  - longest_substring
---
![[problems/pictures/Pasted image 20241014005317.png]]



```c++
// T(n) = O(26 * N)  
class Solution {
public:
  int longestSubstring(std::string &s, int k) {
    int res = 0;

    for (int i = 1; i <= 26; i++) {
      std::unordered_map<char, int> mp; // {char : count}
      int left = 0, valid_count = 0;
      for (int j = 0; j < s.size(); j++) {
        char c = s[j];
        mp[c]++;

        if (mp[c] == k)
          valid_count++;

        while (mp.size() > i) {
          char left_char = s[left];
          if (mp[left_char] == k)
            valid_count--;

          mp[left_char]--;
          if (mp[left_char] == 0)
            mp.erase(left_char);

          left++;
        }
        int count = mp.size();
        if (count == i && count == valid_count)
          res = std::max(j - left + 1, res);
      }
    }

    return res;
  }
};
```