---
tags:
  - prime
  - prime_factor
---
![[pictures/Pasted image 20241013230426.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int find_next(int n) {
    int sum = 0;
    int pre = n;
    for (int i = 2; i <= std::sqrt(pre); i++)
      while (pre % i == 0) {
        sum += i;
        pre /= i;
      }

    if (pre != 1)
      sum += pre;

    return sum;
  }

public:
  int smallestValue(int n) {
    while (true) {
      int next = find_next(n);
      if (next == n)
        break;

      n = next;
    }

    return n;
  }
};
```