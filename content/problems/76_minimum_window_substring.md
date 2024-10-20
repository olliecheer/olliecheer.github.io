---
tags:
  - substring
  - sliding_window
---
![[problems/pictures/Pasted image 20241012201205.png]]
![[problems/pictures/Pasted image 20241012201216.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  std::unordered_map<char, int> origin, count;

  bool check() {
    for (auto &p : origin)
      if (count[p.first] < p.second)
        return false;

    return true;
  }

public:
  std::string minWindow(std::string s, std::string t) {
    for (auto c : t)
      origin[c]++;

    int left = 0, right = 0;
    int len = INT_MAX;
    int res_left = -1, res_right = -1;

    while (right < s.size()) {
      if (origin.count(s[right]))
        count[s[right]]++;

      while (check() && left <= right) {
        if (right - left + 1 < len) {
          len = right - left + 1;
          res_left = left;
        }

        if (origin.count(s[left]))
          count[s[left]]--;

        left++;
      }

      right++;
    }

    return res_left == -1 ? "" : s.substr(res_left, len);
  }
};
```