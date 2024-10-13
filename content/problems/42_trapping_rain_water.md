---
tags:
  - mono_stack
  - trap_water
  - dynamic_programming
---
![[pictures/Pasted image 20241012195926.png]]
![[pictures/Pasted image 20241012195938.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int trap(vec<int> &height) {
    std::stack<int> stk;
    int res = 0, N = height.size();

    for (int i = 0; i < N; i++) {
      while (!stk.empty() && height[stk.top()] < height[i]) {
        int prev = stk.top();
        stk.pop();
        if (stk.empty())
          break;

        int min_height = std::min(height[stk.top()], height[i]);
        res += (min_height - height[prev]) * (i - stk.top() - 1);
      }
      stk.push(i);
    }

    return res;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int trap(vec<int> height) {
    if (height.empty())
      return 0;

    int N = height.size();
    int res = 0;

    vec<int> left(N), right(N);
    left[0] = height[0];
    right[N - 1] = height[N - 1];

    for (int i = 1; i < N; i++)
      left[i] = std::max(left[i - 1], height[i]);

    for (int i = N - 2; i >= 0; i--)
      right[i] = std::max(right[i + 1], height[i]);

    for (int i = 0; i < N; i++)
      res += std::min(left[i], right[i]) - height[i];

    return res;
  }
};
```