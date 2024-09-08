---
tags:
  - bitwise
---
![[problems/pictures/Pasted image 20240908225329.png]]


```c++
class Solution {  
public:  
  int missingNumber(vec<int> &nums) {  
    int miss = 0;  
    for (int it : nums)  
      miss ^= it;  
  
    for (int i = 1; i <= nums.size(); i++)  
      miss ^= i;  
  
    return miss;  
  }  
};
```


```c++
class Solution_2 {  
public:  
  int missingNumber(vec<int> &nums) {  
    int expectedSum = nums.size() * (nums.size() + 1) / 2;  
    int actualSum = std::accumulate(nums.begin(), nums.end(), 0);  
  
    return expectedSum - actualSum;  
  }  
};
```