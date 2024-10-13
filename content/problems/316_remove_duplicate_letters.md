---
tags: []
---
![[pictures/Pasted image 20241014004230.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  std::string removeDuplicateLetters(std::string &s) {
    std::deque<int> stk;
    vec<int> last(128);

    for (int i = 0; i < s.size(); i++)
      last[s[i]] = i;

    std::unordered_set<int> visited;
    for (int i = 0; i < s.size(); i++) {
      int c = s[i];
      if (visited.count(c))
        continue;

      visited.insert(c);
      while (!stk.empty() && c < stk.back() && i < last[stk.back()]) {
        visited.erase(stk.back());
        stk.pop_back();
      }

      stk.push_back(c);
    }

    std::string res(stk.begin(), stk.end());
    return res;
  }
};
```