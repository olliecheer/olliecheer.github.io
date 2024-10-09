---
tags:
---
![[problems/pictures/Pasted image 20240909220441.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool canConstruct(std::string ransomNote, std::string magazine) {
    std::vector<int> ransom_node_letters(128), magazine_letters(128);
    for (char c : ransomNote)
      ransom_node_letters[c]++;
    for (char c : magazine)
      magazine_letters[c]++;

    for (int i = 0; i < 128; i++)
      if (magazine_letters[i] < ransom_node_letters[i])
        return false;

    return true;
  }
};
```