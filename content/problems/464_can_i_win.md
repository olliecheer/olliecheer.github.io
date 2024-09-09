---
tags:
  - game
  - dfs
---
![[problems/pictures/Pasted image 20240909223329.png]]


```c++
class Solution {  
  std::unordered_map<std::string, bool> memo;  
  int max_value;  
  
  std::string vecbool2str(vec<bool> const &vecbool) {  
    std::string res;  
    for (bool it : vecbool) {  
      if (it)  
        res.push_back('1');  
      else  
        res.push_back('0');  
    }  
  
    return res;  
  }  
  
  bool dfs(vec<bool> &used, int target) {  
    if (target <= 0)  
      return false;  
  
    std::string state = vecbool2str(used);  
    if (memo.count(state))  
      return memo[state];  
  
    bool win = false;  
  
    for (int i = 0; i < max_value; i++) {  
      if (!used[i]) {  
        used[i] = true;  
        win = win || !dfs(used, target - (i + 1));  
        used[i] = false;  
      }  
    }  
    memo.insert({state, win});  
    return win;  
  }  
  
public:  
  bool canIWin(int maxChoosableInteger, int desiredTotal) {  
    max_value = maxChoosableInteger;  
    if (desiredTotal <= 0)  
      return true;  
  
    if (maxChoosableInteger * (maxChoosableInteger + 1) / 2 < desiredTotal)  
      return false;  
  
    vec<bool> used(maxChoosableInteger + 1);  
    return dfs(used, desiredTotal);  
  }  
};
```