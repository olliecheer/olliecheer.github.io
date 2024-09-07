---
tags:
  - combination
  - dfs
---
![[problems/pictures/Pasted image 20240907193619.png]]


```c++
class Solution {  
  
  vec<std::string> mp = {  
      "", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz",  
  };  
  
  vec<std::string> res;  
  
  void dfs(std::string const &digits, std::string &tmp, int index) {  
    if (tmp.size() == digits.size()) {  
      res.push_back(tmp);  
      return;  
    }  
  
    auto letters = mp[digits[index] - '0'];  
    for (char c : letters) {  
      tmp.push_back(c);  
      dfs(digits, tmp, index + 1);  
      tmp.pop_back();  
    }  
  }  
  
public:  
  vec<std::string> letterCombinations(std::string digits) {  
    if (!digits.empty()) {  
      std::string tmp;  
      dfs(digits, tmp, 0);  
    }  
  
    return res;  
  }  
};
```