---
tags:
  - subarray
  - rolling_hash
  - binary_search
  - dynamic_programming
---
![[problems/pictures/Pasted image 20240909232743.png]]


### Binary Search

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  bool check(vec<int> &A, vec<int> &B, int length) {
    std::set<vec<int>> seen;
    for (int i = 0; i + length <= A.size(); i++)
      seen.insert(vec<int>(A.begin() + i, A.begin() + i + length));

    for (int j = 0; j + length <= B.size(); j++)
      if (seen.contains(vec<int>(B.begin() + j, B.begin() + j + length)))
        return true;

    return false;
  }

public:
  int findLength(vec<int> &A, vec<int> &B) {
    int low = 0, high = std::min(A.size(), B.size()) + 1;
    while (low < high) {
      int mid = low + (high - low) / 2;
      if (check(A, B, mid))
        low = mid + 1;
      else
        high = mid;
    }

    return low - 1;
  }
};
```


### Dynamic Programming

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int findLength(vec<int> &A, vec<int> &B) {
    int M = A.size(), N = B.size();
    vec<vec<int>> dp(M + 1, vec<int>(N + 1));
    int res = 0;
    for (int i = M - 1; i >= 0; i--) {
      for (int j = N - 1; j >= 0; j--) {
        if (A[i] == B[j])
          dp[i][j] = dp[i + 1][j + 1] + 1;

        res = std::max(res, dp[i][j]);
      }
    }

    return res;
  }
};
```


### Binary Search + Rolling Hash

- Give Up :(

```c++
template <typename T> using vec = std::vector<T>;

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
      } else
        right = mid - 1;
    }

    return max_len;
  }
};
```
