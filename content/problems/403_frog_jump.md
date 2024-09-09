---
tags:
  - jump_game
---
![[problems/pictures/Pasted image 20240909221135.png]]

```c++
// O(N^3)  
class Solution {  
  int can_Cross(vec<int> &stones, int ind, int jumpsize, vec<vec<int>> &memo) {  
    if (memo[ind][jumpsize] >= 0)  
      return memo[ind][jumpsize];  
  
    for (int i = ind + 1; i < stones.size(); i++) {  
      int gap = stones[i] - stones[ind];  
      if (gap >= jumpsize - 1 && gap <= jumpsize + 1) {  
        if (can_Cross(stones, i, gap, memo) == 1) {  
          memo[ind][gap] = 1;  
          return 1;  
        }  
      }  
    }  
  
    memo[ind][jumpsize] = (ind == stones.size() - 1) ? 1 : 0;  
    return memo[ind][jumpsize];  
  }  
  
public:  
  bool canCross(vec<int> stones) {  
    vec<vec<int>> memo(stones.size(), vec<int>(stones.size(), -1));  
    return can_Cross(stones, 0, 0, memo) == 1;  
  }  
};
```


```c++
// O(N^2)  
class Solution_ {  
  int can_Cross(vec<int> &stones, int ind, int jumpsize, vec<vec<int>> &memo) {  
    if (memo[ind][jumpsize] >= 0)  
      return memo[ind][jumpsize];  
  
    for (int i = ind + 1; i < stones.size(); i++) {  
      int gap = stones[i] - stones[ind];  
      if (gap >= jumpsize - 1 && gap <= jumpsize + 1) {  
        if (can_Cross(stones, i, gap, memo) == 1) {  
          memo[ind][gap] = 1;  
          return 1;  
        }  
      }  
    }  
  
    memo[ind][jumpsize] = (ind == stones.size() - 1) ? 1 : 0;  
    return memo[ind][jumpsize];  
  }  
  
public:  
  bool canCross(vec<int> stones) {  
    std::unordered_map<int, std::unordered_set<int>> mp;  
    mp[stones[0]].insert(1);  
  
    int last = stones.back();  
    for (int i = 0; i < stones.size(); i++) {  
      for (int step : mp[stones[i]]) {  
        int tmp = step + stones[i];  
        if (tmp == last)  
          return true;  
  
        if (mp.count(tmp)) {  
          mp[tmp].insert(step);  
          mp[tmp].insert(step + 1);  
          if (step - 1 > 0)  
            mp[tmp].insert(step - 1);  
        }  
      }  
    }  
  
    return false;  
  }  
};
```