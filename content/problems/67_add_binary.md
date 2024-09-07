---
tags: []
---

![[problems/pictures/Pasted image 20240907234006.png]]

```c++
class Solution {  
  std::string addBinary(std::string a, std::string b) {  
    std::string res;  
    int i = a.size() - 1, j = b.size() - 1;  
    int carry = 0;  
  
    while (i >= 0 || j >= 0 || carry == 1) {  
      int sum = carry;  
      if (i >= 0) {  
        sum += a[i] - '0';  
        i--;  
      }  
  
      if (j >= 0) {  
        sum += b[j] - '0';  
        j--;  
      }  
  
      res.push_back(sum % 2 + '0');  
      carry = sum / 2;  
    }  
  
    std::reverse(res.begin(), res.end());  
    return res;  
  }  
};
```