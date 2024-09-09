---
tags:
  - paint_house
---
![[problems/pictures/Pasted image 20240910013120.png]]
![[problems/pictures/Pasted image 20240910013130.png]]

```c++
class Solution {  
    vec<vec<vec<std::optional<int>>>> memo;  
    vec<int> houses;  
    vec<vec<int>> cost;  
    int M, N;  
  
  
    long dfs(int cur, int pre_color, int target) {  
        if (target < 0)  
            return std::numeric_limits<int>::max();  
        if (cur == M && target == 0)  
            return 0;  
  
        if (cur == M)  
            return std::numeric_limits<int>::max();  
  
        if (pre_color >= 0 && memo[cur][pre_color][target])  
            return memo[cur][pre_color][target].value();  
  
        long min_cost = std::numeric_limits<int>::max();  
        if (houses[cur] == 0) {  
            for (int cur_color = 1; cur_color <= N; cur_color++) {  
                if (cur_color == pre_color)  
                    min_cost = std::min(min_cost, cost[cur][cur - 1] + dfs(cur + 1, cur_color, target));  
                else  
                    min_cost = std::min(min_cost, cost[cur][cur - 1] + dfs(cur + 1, cur_color, target - 1));  
            }  
        } else {  
            if (houses[cur] == pre_color)  
                min_cost = std::min(min_cost, dfs(cur + 1, houses[cur], target));  
            else  
                min_cost = std::min(min_cost, dfs(cur + 1, houses[cur], target - 1));  
        }  
  
        memo[cur][pre_color][target] = min_cost;  
        return min_cost;  
    }  
  
  
public:  
    int minCost(vec<int> house, vec<vec<int>> cost, int m, int n, int target) {  
        this->memo = vec<vec<vec<std::optional<int>>>>(m + 1, vec<vec<std::optional<int>>>(n + 1,  
                                                                                           vec<std::optional<int>>(  
                                                                                                   target + 1)));  
        this->houses = std::move(house);  
        this->cost = std::move(cost);  
        M = m;  
        N = n;  
  
        int res = (int) dfs(0, 0, target);  
        return res == std::numeric_limits<int>::max() ? -1 : res;  
    }  
};
```