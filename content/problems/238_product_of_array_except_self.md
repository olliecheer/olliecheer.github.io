---
tags:
  - array
---
![[pictures/Pasted image 20241014001558.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> productExceptSelf(vec<int> nums) {
    int N = nums.size();
    vec<int> answer(N);
    answer[0] = 1;

    for (int i = 1; i < N; i++)
      answer[i] = nums[i - 1] * answer[i - 1];

    int R = 1;
    for (int i = N - 1; i >= 0; i--) {
      answer[i] = answer[i] * R;
      R *= nums[i];
    }

    return answer;
  }
};
```