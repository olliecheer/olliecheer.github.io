---
tags:
  - dfs
---
![[problems/pictures/Pasted image 20240910020550.png]]

```c++
class Solution {  
  int res = std::numeric_limits<int>::max();  
  
  void dfs(vec<int> &jobs, int pos, vec<int> &sum) {  
    int sum_max = *std::max_element(sum.begin(), sum.end());  
    if (pos < 0) {  
      res = std::min(res, sum_max);  
      return;  
    }  
  
    if (sum_max >= res)  
      return;  
  
    for (int i = 0; i < sum.size(); i++) {  
      if (i > 0 && sum[i] == sum[i - 1])  
        continue;  
      sum[i] += jobs[pos];  
      dfs(jobs, pos - 1, sum);  
      sum[i] -= jobs[pos];  
    }  
  }  
  
public:  
  int minimumTimeRequired(vec<int> &jobs, int k) {  
    std::sort(jobs.begin(), jobs.end());  
    vec<int> sum;  
    dfs(jobs, jobs.size() - 1, sum);  
    return res;  
  }  
};
```