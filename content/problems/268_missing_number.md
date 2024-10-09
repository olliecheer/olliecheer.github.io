---
tags:
  - bitwise
---
![[problems/pictures/Pasted image 20240908225329.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int missingNumber(vec<int> &nums) {
    int miss = 0;
    for (int it : nums)
      miss ^= it;

    for (int i = 0; i <= nums.size(); i++)
      miss ^= i;

    return miss;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int missingNumber(vec<int> &nums) {
    int expectedSum = nums.size() * (nums.size() + 1) / 2;
    int actualSum = std::accumulate(nums.begin(), nums.end(), 0);

    return expectedSum - actualSum;
  }
};
```