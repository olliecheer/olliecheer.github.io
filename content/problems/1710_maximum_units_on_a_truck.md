---
tags:
---
![[problems/pictures/Pasted image 20241013225926.png]]
![[problems/pictures/Pasted image 20241013225937.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maximumUnits(vec<vec<int>> boxTypes, int truckSize) {
    std::sort(boxTypes.begin(), boxTypes.end(),
              [](auto &a, auto &b) { return std::greater{}(a[1], b[1]); });

    int res = 0;

	for (auto &it : boxTypes)
		while(it[0] > 0 && truckSize > 0) {
			res += it[1];
			it[0]--;
			truckSize--;
		}

    return res;
  }
};
```