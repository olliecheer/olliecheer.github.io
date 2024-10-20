---
tags:
---
![[problems/pictures/Pasted image 20241014010848.png]]
![[problems/pictures/Pasted image 20241014010857.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  std::string validIPAddress(std::string queryIP) {
    if (queryIP.find('.') != std::string::npos) {
      int last = -1;
      for (int i = 0; i < 4; i++) {
        int cur = (i == 3 ? queryIP.size() : queryIP.find('.', last + 1));
        if (cur == std::string::npos)
          return "Neither";

        if (cur - last - 1 < 1 || cur - last - 1 > 3)
          return "Neither";

        int addr = 0;
        for (int j = last + 1; j < cur; j++) {
          if (!std::isdigit(queryIP[j]))
            return "Neither";

          addr = addr * 10 + (queryIP[j] - '0');
        }

        if (addr > 255)
          return "Neither";

        if (addr > 0 && queryIP[last + 1] == '0')
          return "Neither";

        if (addr == 0 && cur - last - 1 > 1)
          return "Neither";

        last = cur;
      }
      return "IPv4";
    } else {
      int last = -1;
      for (int i = 0; i < 8; i++) {
        int cur = (i == 7 ? queryIP.size() : queryIP.find(':', last + 1));
        if (cur == std::string::npos)
          return "Neither";

        if (cur - last - 1 < 1 || cur - last - 1 > 4)
          return "Neither";

        for (int j = last + 1; j < cur; j++)
          if (!std::isdigit(queryIP[j]) && !('a' <= std::tolower(queryIP[j]) &&
                                             std::tolower(queryIP[j]) <= 'f'))
            return "Neither";

        last = cur;
      }
      return "IPv6";
    }
  }
};

```
