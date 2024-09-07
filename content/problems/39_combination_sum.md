---
tags:
  - array
  - combination
  - recursion
  - dfs
---

https://leetcode.com/problems/combination-sum/description/


```c++
  
template<typename T>  
using vec = std::vector<T>;

class Solution {
	vec<vec<int>> res;
public:
	vec<vec<int>> combinationSum(vec<int>& candidates, int target) {
		
	}

};
class Solution {  
    std::vector<std::vector<int>> res;  
  
    void dfs(std::vector<int> &candidates, int index, std::vector<int> &tmp, int target) {  
        if (index == candidates.size()) {  
            if (target == 0) {  
                res.push_back(tmp);  
            }  
            return;  
        }  
  
        dfs(candidates, index + 1, tmp, target);  
        if (target - candidates[index] >= 0) {  
            tmp.push_back(candidates[index]);  
            dfs(candidates, index, tmp, target - candidates[index]);  
            tmp.pop_back();  
        }  
    }  
  
public:  
    std::vector<std::vector<int>> combinationSum(std::vector<int> &candidates, int target) {  
        std::vector<int> tmp;  
        dfs(candidates, 0, tmp, target);  
        return res;  
    }  
};
```
