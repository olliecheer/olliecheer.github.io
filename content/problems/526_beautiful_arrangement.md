---
tags:
  - dynamic_programming
  - backtracking
---

![[pictures/Pasted image 20241010214028.png]]
![[pictures/Pasted image 20241010214037.png]]

### Dynamic Programming

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int count = 0;
  void calculate(int N, int pos, vec<bool> &visited) {
    if (pos > N)
      count++;

    for (int i = 1; i <= N; i++)
      if (!visited[i] && (pos % i == 0 || i % pos == 0)) {
        visited[i] = true;
        calculate(N, pos + 1, visited);
        visited[i] = false;
      }
  }

public:
  int countArrangement(int N) {
    vec<bool> visited(N + 1);
    calculate(N, 1, visited);
    return count;
  }
};
```
