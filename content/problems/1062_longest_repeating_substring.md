---
tags:
  - longest_substring
  - mod
---
![[problems/pictures/Pasted image 20241013204844.png]]


VIP, not submitted

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
    int longestRepeatingSubstring(std::string s) {
        int length = s.length();
        vec<vec<int>> dp(length + 1, vec<int>(length + 1, 0));
        int maxLength = 0;

        // Populate the DP array
        for (int i = 1; i <= length; i++) {
            for (int j = i + 1; j <= length; j++) {
                // Check if the characters match and update the DP value
                if (s[i - 1] == s[j - 1]) {
                    dp[i][j] = dp[i - 1][j - 1] + 1;
                    maxLength = max(maxLength, dp[i][j]);  // Update maxLength
                }
            }
        }
        return maxLength;
    }
};
```