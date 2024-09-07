---
tags:
  - longest_substring
  - palindrome
  - dynamic_programming
  - dfs
---
![[problems/pictures/Pasted image 20240907192035.png]]


## DFS
```c++
class Solution {  
  int max_size_start = 0;  
  int max_size = 0;  
  
  void helper(std::string s, int cur, int offset) {  
    int left = cur, right = cur + offset;  
    for (; left >= 0 && right < s.size() && s[left] == s[right];  
         left--, right++)  
      ;  
  
    left++;  
    right--;  
  
    int sz = right - left + 1;  
    if (sz > max_size) {  
      max_size_start = left;  
      max_size = sz;  
    }  
  }  
  
public:  
  std::string longestPalindrome(std::string s) {  
    for (int i = 0; i < s.size(); i++) {  
      helper(s, i, 0);  
      helper(s, i, 1);  
    }  
    return s.substr(max_size_start, max_size);  
  }  
};
```


### Dynamic Programming

```c++
class Solution_dp {  
  int dfs(std::string &s, int i, int j, vec<vec<std::optional<int>>> &memo) {  
    if (i > j)  
      return 0;  
    if (i == j)  
      return 1;  
  
    if (memo[i][j])  
      return memo[i][j].value();  
  
    if (s[i] == s[j])  
      memo[i][j] = dfs(s, i + 1, j - 1, memo) + 2;  
    else  
      memo[i][j] = std::max(dfs(s, i + 1, j, memo), dfs(s, i, j - 1, memo));  
  
    return memo[i][j].value();  
  }  
  
public:  
  int longestPalindromeSubseq(std::string &s) {  
    int N = s.size();  
    vec<vec<std::optional<int>>> memo(N, vec<std::optional<int>>(N));  
    return dfs(s, 0, N - 1, memo);  
  }  
};
```