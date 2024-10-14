---
tags:
  - matrix
---
![[problems/pictures/Pasted image 20241014001710.png]]
![[problems/pictures/Pasted image 20241014001722.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  static bool helper(vec<vec<int>> &matrix, int target, int x1, int x2, int y1,
                     int y2) {
    if (x1 > x2 || y1 > y2)
      return false;

    int x_mid = x1 + (x2 - x1) / 2;
    int y_mid = y1 + (y2 - y1) / 2;

    if (matrix[x_mid][y_mid] > target)
      return helper(matrix, target, x1, x_mid - 1, y1, y2) ||
             helper(matrix, target, x1, x2, y1, y_mid - 1);
    else if (matrix[x_mid][y_mid] < target)
      return helper(matrix, target, x_mid + 1, x2, y1, y2) ||
             helper(matrix, target, x1, x2, y_mid + 1, y2);
    else
      return true;
  }

public:
  bool searchMatrix(vec<vec<int>> &matrix, int target) {
    if (matrix.empty() || matrix[0].empty())
      return false;

    return helper(matrix, target, 0, matrix.size() - 1, 0,
                  matrix[0].size() - 1);
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool searchMatrix(vec<vec<int>> &matrix, int target) {
    if (matrix.empty() || matrix[0].empty())
      return false;

    int row = matrix.size() - 1, col = 0;

    while (col < matrix[0].size() && row >= 0) {
      int cur = matrix[row][col];
      if (cur > target)
        row--;
      else if (cur < target)
        col++;
      else
        return true;
    }

    return false;
  }
};
```