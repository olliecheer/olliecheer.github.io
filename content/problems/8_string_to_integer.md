---
tags:
  - integer_overflow
  - atoi
---
![[pictures/Pasted image 20241012194748.png]]
![[pictures/Pasted image 20241012194802.png]]
![[pictures/Pasted image 20241012194816.png]]
![[pictures/Pasted image 20241012194826.png]]


```c++
class Solution {
  bool integerOverflow(int base, int currentDigit) {
    int int_max = std::numeric_limits<int>::max();
    return base > int_max / 10 ||
           (base == int_max / 10 && currentDigit > int_max % 10);
  }

 public:
  int myAtoi(std::string str) {
    int i = 0;
    for (; str[i] == ' '; i++);

    int sign = 1;
    if (str[i] == '-') {
      sign = -1;
      i++;
    } else if (str[i] == '+') {
      sign = 1;
      i++;
    }

    int base = 0;
    for (;i < str.size() && str[i] >= '0' && str[i] <= '9'; i++) {
      if (integerOverflow(base, str[i] - '0'))
        return (sign == 1) ? INT_MAX : INT_MIN;

      base = 10 * base + (str[i] - '0');
    }
    return base * sign;
  }
};
```