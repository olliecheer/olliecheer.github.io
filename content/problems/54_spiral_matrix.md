---
tags:
  - matrix
---
![[problems/pictures/Pasted image 20240907233223.png]]
![[problems/pictures/Pasted image 20240907233230.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> spiralOrder(vec<vec<int>> matrix) {
    vec<int> res;

    int n = matrix.size(), m = matrix[0].size();
    int up = 0, down = n - 1, left = 0, right = m - 1;
    while (res.size() < n * m) {
      for (int i = left; i <= right && res.size() < n * m; i++)
        res.push_back(matrix[up][i]);

      for (int i = up + 1; i <= down - 1 && res.size() < n * m; i++)
        res.push_back(matrix[i][right]);

      for (int i = right; i >= left && res.size() < n * m; i--)
        res.push_back(matrix[down][i]);

      for (int i = down - 1; i >= up + 1 && res.size() < n * m; i--)
        res.push_back(matrix[i][left]);

      left++;
      right--;
      up++;
      down--;
    }

    return res;
  }
};
```