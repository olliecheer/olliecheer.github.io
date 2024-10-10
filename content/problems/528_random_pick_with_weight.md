---
tags:
  - random
---
![[pictures/Pasted image 20241010215614.png]]
![[pictures/Pasted image 20241010215634.png]]
![[pictures/Pasted image 20241010215644.png]]

### Tree Map

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  std::map<int, int> mp;
  int weight;

public:
  explicit Solution(vec<int> &w) {
    for (int i = 0; i < w.size(); i++) {
      weight += w[i];
      mp[weight] = i;
    }
  }

  int pickIndex() {
    int n = rand() % weight;
    auto it = mp.upper_bound(n);
    return it->second;
  }
};
```


### Prefix Sum

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<int> prefix_sum;
  int total;

public:
  explicit Solution(vec<int> &w) : prefix_sum(w.size()) {
    for (int i = 0; i < w.size(); i++) {
      total += w[i];
      prefix_sum[i] = total;
    }
  }

  int pickIndex() {
    double target = total * rand();
    int left = 0, right = prefix_sum.size();
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
