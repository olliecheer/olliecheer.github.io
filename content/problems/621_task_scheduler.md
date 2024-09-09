---
tags:
---
![[problems/pictures/Pasted image 20240909230345.png]]
![[problems/pictures/Pasted image 20240909230401.png]]

```c++
class Solution {  
public:  
  int leastInterval(vec<char> tasks, int n) {  
    vec<int> mp(26);  
    for (char c : tasks)  
      mp[c - 'A']++;  
  
    std::sort(mp.begin(), mp.end(), std::greater<>{});  
    int time = 0;  
    while (mp[0] > 0) {  
  
      // ensure the same tasks are executed once in a cooling down loop  
      for (int i = 0; i <= n; i++) {  
        if (mp[0] == 0)  
          break;  
  
        int next_task = 25 - i;  
        if (next_task >= 0 && mp[next_task] > 0)  
          mp[next_task]--;  
        time++;  
      }  
      std::sort(mp.begin(), mp.end());  
    }  
  
    return time;  
  }  
};
```