---
tags:
  - subarray
---
![[problems/pictures/Pasted image 20241013224001.png]]
![[problems/pictures/Pasted image 20241013224011.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int longestSubarray(vec<int> &A, int limit) {
    std::deque<int> max_diff, min_diff;
    int left = 0, res = 0;

    for (int i = 0; i < A.size(); i++) {
      while (!max_diff.empty() && max_diff.back() < A[i])
        max_diff.pop_back();

      while (!min_diff.empty() && A[i] < min_diff.back())
        min_diff.pop_back();

      max_diff.push_back(A[i]);
      min_diff.push_back(A[i]);

      if (max_diff.front() - min_diff.front() > limit) {
        if (max_diff.front() == A[left])
          max_diff.pop_front();

        if (min_diff.front() == A[left])
          min_diff.pop_front();

        left++;
      }
      res = std::max(res, i - left + 1);
    }

    return res;
  }
};
```