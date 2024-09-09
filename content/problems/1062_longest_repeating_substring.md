---
tags:
  - longest_substring
  - mod
---
![[problems/pictures/Pasted image 20240910004315.png]]

```c++
class Solution {  
  long MOD = (long)std::pow(2, 24);  
  int a = 26;  
  
  bool search(vec<int> &nums, int L) {  
    long hash = 0, aL = 1;  
    for (int i = 0; i < L; i++)  
      hash = (hash * a + nums[i]) % MOD;  
  
    for (int i = 0; i < L; i++)  
      aL = aL * a % MOD;  
  
    std::unordered_set<long> seen;  
    seen.insert(hash);  
  
    for (int i = 0; i < nums.size(); i++) {  
      hash = hash * a;  
      hash = (hash - nums[i] * a % MOD + MOD) % MOD;  
      hash = (hash + nums[i + L]) % MOD;  
      if (seen.count(hash))  
        return true;  
      else  
        seen.insert(hash);  
    }  
  
    return false;  
  }  
  
public:  
  int longestRepeatingSubstring(std::string &s) {  
    int N = s.size();  
    vec<int> nums;  
    for (char c : s)  
      nums.push_back(c - 'a');  
  
    int start = 1, end = N - 1, max_len = 0;  
    while (start <= end) {  
      int mid = start + (end - start) / 2;  
      if (search(nums, mid)) {  
        max_len = mid;  
        start = mid + 1;  
      } else  
        end = mid - 1;  
    }  
  
    return max_len;  
  }  
};
```