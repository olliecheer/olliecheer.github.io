---
tags:
  - prime
  - eratosthenes
---
![[pictures/Pasted image 20241013230516.png]]
![[pictures/Pasted image 20241013230525.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<bool> prime;
  vec<int> small = {-1, -1};

  void generate() {
    std::fill(prime.begin(), prime.end(), true);
    int N = 1000001;
    for (int i = 2; i < N; i++)
      if (prime[i])
        for (int j = 2; i * j < N; j++)
          prime[i * j] = false;
  }

public:
  vec<int> closestPrimes(int left, int right) {
    prime = vec<bool>(1000001);
    int prev = -1;
    int min = INT_MAX;
    generate();

    for (int i = std::max(2, left); i <= right; i++) {
      if (prime[i]) {
        if (prev == -1)
          prev = i;
        else {
          int diff = i - prev;
          if (diff < min) {
            small = {prev, i};
            min = diff;
          }
          prev = i;
        }
      }
    }

    return small;
  }
};
```