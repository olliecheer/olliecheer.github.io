---
tags:
  - array
  - binary_index_tree
---
![[problems/pictures/Pasted image 20241013225432.png]]
![[problems/pictures/Pasted image 20241013225451.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  class BIT {
    vec<int> parent;

  public:
    BIT(int N) : parent(N) {}

    int sum(int x) {
      int sum = 0;
      for (x++; x > 0; x -= (x & -x))
        sum += parent[x];

      return sum;
    }

    void add(int x, int val) {
      for (x++; x < parent.size(); x += (x & -x))
        parent[x] += val;
    }
  };

  int MOD = 1e9 + 7;

public:
  int createSortedArray(vec<int> &instructions) {
    BIT bit(1'000'000);
    int cost = 0;
    for (int num : instructions) {
      int left = bit.sum(num - 1);
      int right = bit.sum(100'000) - bit.sum(num);
      cost = (cost + std::min(left, right)) % MOD;
      bit.add(num, 1);
    }

    return cost;
  }
};
```
