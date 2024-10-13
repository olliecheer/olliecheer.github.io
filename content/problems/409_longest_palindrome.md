---
tags:
  - palindrome
---
![[pictures/Pasted image 20241014005649.png]]



```c++
class Solution {
public:
  int longestPalindrome(std::string s) {
    std::unordered_set<char> st;

    int count = 0;
    for (auto c : s) {
      if (st.count(c)) {
        st.erase(c);
        count++;
      } else
        st.insert(c);
    }

    return st.empty() ? count * 2 : count * 2 + 1;
  }
};
```