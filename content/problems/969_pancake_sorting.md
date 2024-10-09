---
tags:
---
![[problems/pictures/Pasted image 20240910002829.png]]
![[problems/pictures/Pasted image 20240910002836.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int find(vec<int> &A, int target) {
    for (int i = 0; i < A.size(); i++)
      if (A[i] == target)
        return i;

    return -1;
  }

  void flip(vec<int> &A, int index) {
    int i = 0, j = index;
    while (i < j) {
      std::swap(A[i], A[j]);
      i++;
      j--;
    }
  }

public:
  vec<int> pancakeSort(vec<int> &A) {
    vec<int> res;
    int N = A.size();
    int largest = N;

    for (int i = 0; i < N; i++) {
      int idx = find(A, largest);
      flip(A, idx);
      flip(A, largest - 1);
      res.push_back(idx + 1);
      res.push_back(largest);
      largest--;
    }

    return res;
  }
};
```