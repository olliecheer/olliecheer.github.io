---
tags:
    - random
---
![[pictures/Pasted image 20241014011423.png]]
![[pictures/Pasted image 20241014011437.png]]
![[pictures/Pasted image 20241014011445.png]]



### Binary Search

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int X1 = 0, Y1 = 1, X2 = 2, Y2 = 3;
  vec<vec<int>> rects;
  vec<int> prefix_sum;
  int total = 0;

public:
  Solution(vec<vec<int>> _rects) : rects{std::move(_rects)} {
    for (auto &it : rects) {
      total += (it[X2] - it[X1] + 1) * (it[Y2] - it[Y1] + 1);
      prefix_sum.push_back(total);
    }
  }

  vec<int> pick() {
    int idx = get_rand_index();
    auto &pk = rects[idx];
    int width = pk[X2] - pk[X1];
    int height = pk[Y2] - pk[Y1];
    int randX = pk[X1] + rand() % (width + 1);
    int randY = pk[Y1] + rand() % (height + 1);
    return {randX, randY};
  }

  int get_rand_index() {
    int target = rand() % total + 1;
    int left = 0, right = rects.size() - 1;

    while (left <= right) {
      int mid = left + (right - left) / 2;
      if (prefix_sum[mid] < target)
        left = mid + 1;
      else
        right = mid - 1;
    }
    return left;
  }
};
```
