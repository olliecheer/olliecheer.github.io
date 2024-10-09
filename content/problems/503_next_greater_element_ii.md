---
tags:
  - mono_stack
---
![[problems/pictures/Pasted image 20240909230306.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> nextGreaterElemets(vec<int> &nums) {
    int N = nums.size();
    vec<int> res(N);
    std::stack<int> stk;

    for (int i = 2 * N - 1; i >= 0; i--) {
      while (!stk.empty() && nums[i % N] >= stk.top())
        stk.pop();

      res[i % N] = (stk.empty() ? -1 : stk.top());
      stk.push(nums[i % N]);
    }

    return res;
  }
};
```
