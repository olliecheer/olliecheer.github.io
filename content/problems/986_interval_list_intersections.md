---
tags:
---
![[problems/pictures/Pasted image 20240910003206.png]]
![[problems/pictures/Pasted image 20240910003227.png]]

```c++
class Solution {  
public:  
  vec<vec<int>> intervalIntersection(vec<vec<int>> &A, vec<vec<int>> &B) {  
    vec<vec<int>> res;  
    int i = 0, j = 0;  
    while (i < A.size() && j < B.size()) {  
      int low = std::max(A[i][0], B[j][0]);  
      int high = std::min(A[i][1], B[j][1]);  
  
      if (low <= high)  
        res.push_back({low, high});  
  
      if (A[i][1] < B[j][1])  
        i++;  
      else  
        j++;  
    }  
  
    return res;  
  }  
};
```