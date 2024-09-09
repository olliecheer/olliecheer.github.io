---
tags:
---
![[problems/pictures/Pasted image 20240909212300.png]]

```c++
class Solution {  
public:  
  vec<int> countSmaller(vec<int> &nums) {  
    vec<int> res;  
    if (nums.empty())  
      return res;  
  
    int N = nums.size();  
    for (int i = 0; i < N; i++)  
      nums[i] += 10001;  
    vec<int> exist(20001);  
  
    SegmentTree st(vec<int>(20001));  
    exist[nums[N - 1]]++;  
    st.update(nums[N - 1], exist[nums[N - 1]]);  
    res.push_back(0);  
  
    for (int i = N - 2; i >= 0; i--) {  
      exist[nums[i]]++;  
      st.update(nums[i], exist[nums[i]]);  
      res[0] = st.sum_range(0, nums[i] - 1);  
    }  
  
    return res;  
  }  
};
```