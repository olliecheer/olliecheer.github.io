---
tags:
  - dfs
  - pruning
---
![[problems/pictures/Pasted image 20241010092455.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int res = INT_MAX;

  void dfs(vec<int> &jobs, int pos, vec<int> &sum) {
    if (pos < 0) {
      res = std::min(res, sum_max);
      return;
    }
    
    int sum_max = *std::max_element(sum.begin(), sum.end()); // pruning
    if (sum_max >= res)
      return;

    for (int i = 0; i < sum.size(); i++) {
      if (i > 0 && sum[i] == sum[i - 1]) // pruning
        continue;
      sum[i] += jobs[pos];
      dfs(jobs, pos - 1, sum);
      sum[i] -= jobs[pos];
    }
  }

public:
  int minimumTimeRequired(vec<int> &jobs, int k) {
    std::sort(jobs.begin(), jobs.end()); // pruning
    vec<int> sum(k);
    dfs(jobs, jobs.size() - 1, sum);
    return res;
  }
};
```