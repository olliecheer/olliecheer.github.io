---
tags:
---
![[pictures/Pasted image 20241014010238.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> findAnagrams(std::string s, std::string p) {
    vec<int> res;
    vec<int> target(26), current(26);

    for (char c : p) {
      target[c - 'a']++;
    }

    for (int i = 0; i < s.size(); i++) {
      current[s[i] - 'a']++;
      if (i >= p.size() - 1) {
        int start_index = i - p.size() + 1;
        if (target == current)
          res.push_back(start_index);

        current[s[start_index] - 'a']--;
      }
    }

    return res;
  }
};
```