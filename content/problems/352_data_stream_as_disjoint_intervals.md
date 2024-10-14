---
tags:
  - data_stream
---
![[problems/pictures/Pasted image 20241014004658.png]]
![[problems/pictures/Pasted image 20241014004709.png]]



```c++
template <typename T> using vec = std::vector<T>;

class SummaryRanges {
  std::map<int, int> intervals;

public:
  SummaryRanges() {}

  void addNum(int value) {
    int left = value, right = value;

    // [lower_bound, upper_bound)
    auto upper = intervals.upper_bound(value);
    if (upper != intervals.begin()) {
      auto max_entry = upper;
      max_entry--; // now max_entry <= value
      if (max_entry->second >= value)
        // so max_entry covers the value, just return
        return;

      // now max_entry->second < value
      if (max_entry->second == value - 1)
        // so max_entry->second and value are neighbors, just merge them
        left = max_entry->first;
    }

    // upper and value are neighbors, just merge them
    if (upper != intervals.end() && upper->first == value + 1) {
      right = upper->second;
      intervals.erase(upper);
    }
    intervals[left] = right;
  }

  vec<vec<int>> getIntervals() {
    vec<vec<int>> res;

    for (auto &it : intervals)
      res.push_back({it.first, it.second});

    return res;
  }
};
```