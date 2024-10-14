---
tags:
  - jump_game
---
![[problems/pictures/Pasted image 20241014005500.png]]
![[problems/pictures/Pasted image 20241014005509.png]]



### Brutal Force
```c++
// O(3^N)
template <typename T> using vec = std::vector<T>;

class Solution {
  bool can_Cross(vec<int> &stones, int idx, int jumpsize) {
    for (int i = idx + 1; i < stones.size(); i++) {
      int gap = stones[i] - stones[idx];
      if (gap >= jumpsize - 1 && gap <= jumpsize + 1 &&
          can_Cross(stones, i, gap))
        return true;
    }

    return idx == stones.size() - 1;
  }

public:
  bool canCross(vec<int> stones) { return can_Cross(stones, 0, 0); }
};
```


```c++
// O(N^3)  
template <typename T> using vec = std::vector<T>;

class Solution {
  bool can_Cross(vec<int> &stones, int idx, int jumpsize,
                 vec<vec<bool>> &memo) {
    if (memo[idx][jumpsize])
      return memo[idx][jumpsize];

    for (int i = idx + 1; i < stones.size(); i++) {
      int gap = stones[i] - stones[idx];
      if (gap >= jumpsize - 1 && gap <= jumpsize + 1 &&
          can_Cross(stones, i, gap, memo)) {
        memo[idx][gap] = true;
        return true;
      }
    }

    memo[idx][jumpsize] = (idx == stones.size() - 1);
    return memo[idx][jumpsize];
  }

public:
  bool canCross(vec<int> stones) {
    vec<vec<bool>> memo(stones.size(), vec<bool>(stones.size()));
    return can_Cross(stones, 0, 0, memo);
  }
};
```


```c++
// O(N^2)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool canCross(vec<int> stones) {
    // {stone_value, (available_step)}
    std::unordered_map<int, std::unordered_set<int>> mp;
    for (auto it : stones)
      mp[it] = {};
    mp[stones[0]].insert(1);

    int last_stone = stones.back();
    for (int i = 0; i < stones.size(); i++) {
      for (int step : mp[stones[i]]) {
        int cur = stones[i] + step;
        if (cur == last_stone)
          return true;

        if (mp.count(cur)) {
          mp[cur].insert(step);
          mp[cur].insert(step + 1);
          if (step - 1 > 0)
            mp[cur].insert(step - 1);
        }
      }
    }

    return false;
  }
};
```