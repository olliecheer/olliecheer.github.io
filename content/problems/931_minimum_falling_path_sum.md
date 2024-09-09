---
tags:
  - sum
  - matrix
---
![[problems/pictures/Pasted image 20240910002424.png]]
![[problems/pictures/Pasted image 20240910002436.png]]

```c++
class Solution {  
public:  
  int minFallingPathSum(vec<vec<int>> &A) {  
    int N = A.size();  
    for (int r = N - 2; r >= 0; r--) {  
      for (int c = 0; c < N; c++) {  
        int min_value = A[r + 1][c];  
        if (c > 0)  
          min_value = std::min(min_value, A[r + 1][c - 1]);  
        if (c + 1 < N)  
          min_value = std::min(min_value, A[r + 1][c + 1]);  
  
        A[r][c] += min_value;  
      }  
    }  
  
    int res = std::numeric_limits<int>::max();  
    return *std::min_element(A[0].begin(), A[0].end());  
  }  
};
```