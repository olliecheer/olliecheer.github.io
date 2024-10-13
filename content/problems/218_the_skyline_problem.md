---
tags:
  - scanning_line
---
![[pictures/Pasted image 20241014000553.png]]
![[pictures/Pasted image 20241014000611.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<vec<int>> getSkyline(vec<vec<int>> &buildings) {
    vec<vec<int>> res;
    vec<vec<int>> heights;
    for (auto &&it : buildings) {
      int left = it[0], right = it[1], height = it[2];
      heights.push_back({left, -height});
      heights.push_back({right, height});
    }

    std::sort(heights.begin(), heights.end());

    std::multiset<int, std::greater<>> pq;
    pq.insert(0);

    int prev_max = 0;
    for (auto &&it : heights) {
      auto &&location = it[0];
      auto &&height = it[1];
      if (height < 0)
        pq.insert(-height);
      else
        pq.erase(pq.equal_range(height).first);

      int cur_max = *pq.begin();
      if (cur_max != prev_max) {
        res.push_back({location, cur_max});
        prev_max = cur_max;
      }
    }

    return res;
  }
};
```