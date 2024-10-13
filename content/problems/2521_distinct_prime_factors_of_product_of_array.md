---
tags:
  - prime
  - prime_factor
---
![[pictures/Pasted image 20241013230456.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int distinctPrimeFactors(vec<int> nums) {
    std::unordered_set<int> st;
    for (int x : nums) {
      int i = 2;
      while (i * i <= x) {
        if (x % i == 0) {
          st.insert(i);
          while (x % i == 0)
            x /= i;
        }
        i++;
      }
      if (x > 1)
        st.insert(x);
    }

    return st.size();
  }
};
```