---
tags:
  - prime
---
![[problems/pictures/Pasted image 20241013235745.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int countPrimes(int n) {
    if (n <= 2)
      return 0;

    vec<bool> prime(n, true);
    for (int i = 2; i * i <= n; i++)
      if (prime[i]) {
        for (int j = i * i; j < n; j += i)
          prime[j] = false;
      }

    int cnt = 0;
    for (int i = 2; i < prime.size(); i++)
      if (prime[i])
        cnt++;

    return cnt;
  }
};
```
