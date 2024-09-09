---
tags:
---
![[problems/pictures/Pasted image 20240910010151.png]]
![[problems/pictures/Pasted image 20240910010203.png]]


```c++
class Solution {  
public:  
  int jobScheduling(vec<int> &startTime, vec<int> &endTime, vec<int> &profit) {  
    int nr = startTime.size();  
    vec<vec<int>> jobs(nr);  
    for (int i = 0; i < nr; i++) {  
      jobs[i] = {startTime[i], endTime[i], profit[i]};  
    }  
  
    std::sort(jobs.begin(), jobs.end(),  
              [](vec<int> const &job1, vec<int> const &job2) {  
                return job1[1] < job2[1];  
              });  
  
    std::map<int, int> dp; // endTime => maxProfit  
    dp[0] = 0;  
  
    auto get_last_it = [](auto container) {  
      auto res = container.end();  
      res--;  
      return res;  
    };  
  
    for (auto const &job : jobs) {  
      auto it = dp.lower_bound(job[0]);  
  
      int cur_profit = it->second = job[2];  
  
      auto it_last = get_last_it(dp);  
  
      if (cur_profit > it_last->second) {  
        dp[job[1]] = cur_profit;  
      }  
    }  
  
    return get_last_it(dp)->second;  
  }  
};
```