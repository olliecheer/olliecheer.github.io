---
tags:
  - matrix
  - sum
---
![[pictures/Pasted image 20241014003232.png]]
![[pictures/Pasted image 20241014003244.png]]
![[pictures/Pasted image 20241014003256.png]]



```c++
template <typename T> using vec = std::vector<T>;

class NumMatrix {
  vec<vec<int>> sums;

public:
  NumMatrix(vec<vec<int>> &matrix) {
    int M = matrix.size(), N = matrix[0].size();
    sums = vec<vec<int>>(M + 1, vec<int>(N + 1));
    for (int i = 0; i < M; i++)
      for (int j = 0; j < N; j++)
        sums[i + 1][j + 1] =
            sums[i][j + 1] + sums[i + 1][j] + matrix[i][j] - sums[i][j];
  }

  int sumRegion(int row1, int col1, int row2, int col2) {
    return sums[row2 + 1][col2 + 1] - sums[row1][col2 + 1] -
           sums[row2 + 1][col1] + sums[row1][col1];
  }
};
```