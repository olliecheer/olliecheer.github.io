---
tags:
  - sort
  - frequency
---
![[pictures/Pasted image 20241014010606.png]]
![[pictures/Pasted image 20241014010614.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  std::string frequencySort(std::string &s) {
    std::unordered_map<char, int> mp;
    for (char c : s)
      mp[c]++;

    vec<vec<char>> bucket(s.size() + 1);
    for (auto &&it : mp) {
      char key = it.first;
      int freq = it.second;
      bucket[freq].push_back(key);
    }

    std::string res;
    for (int i = bucket.size() - 1; i >= 0; i--)
      for (char c : bucket[i])
        for (int j = 0; j < i; j++)
          res.push_back(c);

    return res;
  }
};
```