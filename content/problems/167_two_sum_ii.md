---
tags:
  - sum
---
![[problems/pictures/Pasted image 20241013235128.png]]
![[problems/pictures/Pasted image 20241013235136.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> twoSum(vec<int> &numbers, int target) {
    int left = 0, right = numbers.size() - 1;
    while (left < right) {
      int tmp = numbers[left] + numbers[right];
      if (tmp == target)
        return {left + 1, right + 1};
      else if (tmp > target)
        right--;
      else
        left++;
    }

    return {};
  }
};
```