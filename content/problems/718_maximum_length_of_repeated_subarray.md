---
tags:
  - subarray
---
![[problems/pictures/Pasted image 20240909232743.png]]

```c++
class Solution {  
  long MOD = (long)1e9 + 7;  
  long a = (long)1e6;  
  
  bool search(vec<int> &A, vec<int> &B, int L) {  
    long h1 = 0, h2 = 0, aL = 1;  
    for (int i = 0; i < L; i++) {  
      h1 = (h1 * a + A[i]) % MOD;  
      h2 = (h2 * a + B[i]) % MOD;  
    }  
  
    for (int i = 1; i <= L; i++)  
      aL = (aL * a) % MOD;  
  
    std::unordered_set<long> seen;  
    seen.insert(h1);  
  
    for (int i = 1; i < A.size() - L + 1; i++) {  
      h1 = h1 * a;  
      h1 = (h1 - A[i - 1] * aL % MOD + MOD) % MOD;  
      h1 = (h1 + A[i + L - 1]) % MOD;  
      seen.insert(h1);  
    }  
  
    if (seen.count(h2))  
      return true;  
  
    for (int i = 1; i < B.size() - L + 1; i++) {  
      h2 = h2 * a;  
      h2 = (h2 - B[i - 1] * aL % MOD + MOD) % MOD;  
      h2 = (h2 + B[i + L - 1]) % MOD;  
      if (seen.count(h2))  
        return true;  
    }  
  
    return false;  
  }  
  
public:  
  int findLength(vec<int> &A, vec<int> &B) {  
    int N1 = A.size(), N2 = B.size();  
    int left = 1, right = std::min(N1, N2);  
    int max_len = 0;  
  
    while (left <= right) {  
      int mid = left + (right - left) / 2;  
      if (search(A, B, mid)) {  
        max_len = mid;  
        left = mid + 1;  
      } else {  
        right = mid - 1;  
      }  
    }  
  
    return max_len;  
  }  
};
```