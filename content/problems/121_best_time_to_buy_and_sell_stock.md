---
tags:
  - sell_stock
---
![[problems/pictures/Pasted image 20240908030102.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maxProfit(vec<int> &prices) {
    if (prices.size() == 1)
      return 0;

    int max_price = prices.back();
    int res = 0;

    for (int i = prices.size() - 2; i >= 0; i--) {
      res = std::max(res, max_price - prices[i]);
      max_price = std::max(max_price, prices[i]);
    }

    return res;
  }
};
```