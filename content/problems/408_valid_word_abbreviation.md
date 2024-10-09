---
tags:
  - dual_pointers
---

![[problems/pictures/Pasted image 20240909221428.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool validWordAbbreviation(std::string &word, std::string &abbr) {
    int i = 0, j = 0;
    while (i < word.size() && j < abbr.size()) {
      if (word[i] == abbr[j]) {
        i++;
        j++;
        continue;
      }

      if (abbr[j] <= '0' || abbr[j] > '9')
        return false;

      int start = j;
      while (j < abbr.size() && abbr[j] >= '0' && abbr[j] <= '9')
        j++;

      int num = std::stoi(abbr.substr(start, j - start));
      i += num;
    }

    return i == word.size() && j == abbr.size();
  }
};
```