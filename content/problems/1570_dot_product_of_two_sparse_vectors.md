---
tags:
  - binary_search
---
![[pictures/Pasted image 20241013224830.png]]
![[pictures/Pasted image 20241013224839.png]]


```c++
template <typename T> using vec = std::vector<T>;

class SparseVector {
  vec<vec<int>> lst;

  int binarySearch(int index, int left, int right) {
    while (left <= right) {
      int mid = left + (right - left) / 2;
      if (lst[mid][0] == index)
        return lst[mid][1];

      if (lst[mid][0] < index)
        left = mid + 1;
      else
        right = mid - 1;
    }

    return 0;
  }

public:
  SparseVector(vec<int> nums) {
    for (int i = 0; i < nums.size(); i++)
      lst.push_back({i, nums[i]});
  }

  int dotProduct(SparseVector &vec) {
    if (vec.lst.size() > lst.size())
      return vec.dotProduct(*this);

    int res = 0;

    for (int i = 0; i < vec.lst.size(); i++) {
      int index = vec.lst[i][0];
      int value = vec.lst[i][1];

      res += value * binarySearch(index, 0, lst.size() - 1);
    }

    return res;
  }
};
```
