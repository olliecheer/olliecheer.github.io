---
tags:
  - substring
---
![[problems/pictures/Pasted image 20240910004128.png]]

```c++
class Solution {  
  long MOD = {(long)std::pow(2, 32)};  
  int a = 26;  
  int N;  
  
  int search(std::string &s, int L, vec<int> &nums) {  
    int h = 0;  
    int aL = 1;  
    for (int i = 0; i < L; i++)  
      h = (h * a + nums[i]) % MOD;  
  
    for (int i = 1; i <= L; i++)  
      aL = (aL * a) % MOD;  
  
    std::unordered_map<long, vec<int>> visited;  
    visited[h].push_back(0);  
  
    for (int start = 1; start < N - L + 1; start++) {  
      h = h * a;  
      h = (h - nums[start - 1] * aL % MOD + MOD) % MOD;  
      h = (h + nums[start + L - 1]) % MOD;  
  
      if (visited.count(h)) {  
        for (int i : visited[h]) {  
          if (s.substr(i, L) == s.substr(start, L))  
            return i;  
        }  
      }  
  
      visited[h].push_back(start);  
    }  
  
    return -1;  
  }  
  
public:  
  std::string longestDupSubstring(std::string &s) {  
    N = s.size();  
    vec<int> nums(N);  
    for (int i = 0; i < N; i++)  
      nums[i] = s[i] - 'a';  
    int low = 1, high = N - 1;  
  
    while (low <= high) {  
      int mid = low + (high - low) / 2;  
      int start_index = search(s, mid, nums);  
      if (start_index == -1)  
        high = mid - 1;  
      else  
        low = mid + 1;  
    }  
  
    int start_index = search(s, high, nums);  
    return start_index == -1 ? "" : s.substr(start_index, high);  
  }  
};
```