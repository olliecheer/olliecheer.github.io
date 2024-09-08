---
tags:
  - prime
---
![[problems/pictures/Pasted image 20240908184850.png]]

```c++
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


```c++
class Solution_2 {  
public:  
  int countPrimes(int n) {  
    if (n <= 2)  
      return 0;  
  
    vec<bool> not_prime(n, true);  
  
    for (int p = 2; p <= (int)std::sqrt(n); p++)  
      if (!not_prime[p])  
        for (int j = p * p; j < n; j += p)  
          not_prime[j] = true;  
  
    int number_of_primes = 0;  
  
    for (int i = 2; i < n; i++)  
      if (!not_prime[i])  
        number_of_primes++;  
  
    return number_of_primes;  
  }  
};
```