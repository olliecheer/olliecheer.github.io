---
tags:
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240910014441.png]]
![[problems/pictures/Pasted image 20240910014458.png]]
![[problems/pictures/Pasted image 20240910014512.png]]


```c++
class Solution {  
  int dfs(vec<int> &cuts, int n, int left, int right,  
          vec<vec<std::optional<int>>> &memo) {  
    if (memo[left][right])  
      return memo[left][right].value();  
  
    if (left >= right)  
      return 0;  
  
    int cost = (right == cuts.size() ? n : cuts[right]) -  
               (left == 0 ? 0 : cuts[left - 1]);  
    memo[left][right] = std::numeric_limits<int>::max();  
  
    for (int i = left; i < right; i++)  
      memo[left][right] = std::min(memo[left][right].value(),  
                                   dfs(cuts, n, left, i, memo) +  
                                       dfs(cuts, n, i + 1, right, memo) + cost);  
  
    return memo[left][right].value();  
  }  
  
public:  
  int minCost(int n, vec<int> &cuts) {  
    std::sort(cuts.begin(), cuts.end());  
    vec<vec<std::optional<int>>> memo(cuts.size() + 1,  
                                      vec<std::optional<int>>(cuts.size() + 1));  
  }  
};
```