---
tags:
  - parentheses
---
![[pictures/Pasted image 20241014001759.png]]
![[pictures/Pasted image 20241014001812.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> diffWaysToCompute(std::string input) {
    vec<int> res;
    for (int i = 0; i < input.size(); i++) {
      char c = input[i];
      if (c == '+' || c == '-' || c == '*') {
        auto left_res = diffWaysToCompute(input.substr(0, i));
        auto right_res = diffWaysToCompute(input.substr(i + 1));

        for (int left : left_res) {
          for (int right : right_res) {
            int tmp = 0;
            if (c == '+')
              tmp = left + right;
            else if (c == '-')
              tmp = left - right;
            else
              tmp = left * right;

            res.push_back(tmp);
          }
        }
      }
    }

    if (res.empty())
      res.push_back(std::stoi(input));

    return res;
  }
};
```