---
tags:
---
![[problems/pictures/Pasted image 20240910015952.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maximumUnits(vec<vec<int>> boxTypes, int truckSize) {
    std::sort(boxTypes.begin(), boxTypes.end(),
              [](auto &a, auto &b) { return std::greater{}(a[1], b[1]); });

    int res = 0;

    for (int i = 0; i < boxTypes.size(); i++)
      while (boxTypes[i][0] > 0 && truckSize > 0) {
        res += boxTypes[i][1];
        boxTypes[i][0]--;
        truckSize--;
      }

    return res;
  }
};
```