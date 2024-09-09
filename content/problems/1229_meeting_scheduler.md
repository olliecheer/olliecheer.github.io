---
tags:
  - scanning_line
---

![[problems/pictures/Pasted image 20240910010116.png]]

```c++
class Solution {  
public:  
  vec<int> minAvailableDuration(vec<vec<int>> &slots1, vec<vec<int>> &slots2,  
                                int duration) {  
    std::sort(slots1.begin(), slots1.end());  
    std::sort(slots2.begin(), slots2.end());  
    int i = 0, j = 0;  
    int n1 = slots1.size(), n2 = slots2.size();  
    while (i < n1 && j < n2) {  
      int intersect_start = std::max(slots1[i][0], slots2[j][0]);  
      int intersect_end = std::max(slots1[i][1], slots2[j][1]);  
      if (intersect_end - intersect_start >= duration)  
        return {intersect_start, intersect_start + duration};  
      else if (slots1[i][1] < slots2[j][1])  
        i++;  
      else  
        j++;  
    }  
  
    return {};  
  }  
};
```