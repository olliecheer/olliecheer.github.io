---
tags:
  - palindrome
  - rolling_hash
---
![[problems/pictures/Pasted image 20241014000404.png]]



### Rolling Hash

```c++
class Solution {
public:
  std::string shortestPalindrome(std::string s) {
    // Select a prime number as the modulus. This choice helps avoid overflow
    // issues and ensures a good distribution of hash values.
    uint64_t MOD_VALUE = 1e9 + 7;
    // Choose a base (usually a prime number as well), which is often the
    // size of the character set (e.g., 256 for ASCII characters).
    uint64_t HASH_BASE = 26;

    uint64_t forward_hash = 0;
    uint64_t reverse_hash = 0;
    uint64_t power_value = 1;

    int palindrome_end_index = -1;

    auto c2v = [](char c) { return c - 'a' + 1; };

    for (int i = 0; i < s.size(); i++) {
      char cur_char = s[i];

      forward_hash = (forward_hash * HASH_BASE + c2v(cur_char)) % MOD_VALUE;
      reverse_hash = (reverse_hash + c2v(cur_char) * power_value) % MOD_VALUE;
      power_value = (power_value * HASH_BASE) % MOD_VALUE;

      if (forward_hash == reverse_hash)
        palindrome_end_index = i;
    }

    std::string suffix = s.substr(palindrome_end_index + 1);
    std::reverse(suffix.begin(), suffix.end());
    return suffix + s;
  }
};
```
