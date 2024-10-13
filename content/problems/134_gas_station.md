---
tags:
  - gas_station
  - dynamic_programming
---
![[pictures/Pasted image 20241013233920.png]]
![[pictures/Pasted image 20241013233928.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int canCompleteCircuit(vec<int> gas, vec<int> cost) {
    int gasTank = 0, start_idx = 0, nr = gas.size(), balance = 0;

    for (int i = 0; i < nr; i++) {
      balance += gas[i] - cost[i];
      gasTank += gas[i] - cost[i];
      if (gasTank < 0) {
        start_idx = i + 1;
        gasTank = 0;
      }
    }

    return balance < 0 ? -1 : start_idx;
  }
};
```