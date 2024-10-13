---
tags:
  - mono_stack
  - dfs
---
![[pictures/Pasted image 20241012201553.png]]
![[pictures/Pasted image 20241012201606.png]]


## Mono Stack

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int largestRectangleArea(vec<int> heights) {
    std::stack<int> stk;
    stk.push(-1);
    int res = 0, N = heights.size();
    for (int i = 0; i < N; i++) {
      while (stk.top() != -1 && heights[stk.top()] >= heights[i]) {
        int prev_height = heights[stk.top()];
        stk.pop();
        int width = i - stk.top() - 1;
        res = std::max(res, prev_height * width);
      }
      stk.push(i);
    }
    while (stk.top() != -1) {
      int prev_height = heights[stk.top()];
      stk.pop();
      int width = N - stk.top() - 1;
      res = std::max(res, prev_height * width);
    }
    return res;
  }
};
```


## DFS

Time limit Exceeded. But you can use two monostacks to get fixt int.

```c++
class Solution_dfs {  
  int dfs(vec<int> &heights, int start, int end) {  
    if (start > end)  
      return 0;  
  
    int min_height_index = start;  
    for (int i = start; i <= end; i++) {  
      if (heights[min_height_index] > heights[i])  
        min_height_index = i;  
    }  
  
    int cur = heights[min_height_index] * (end - start + 1);  
    int left = dfs(heights, start, min_height_index - 1);  
    int right = dfs(heights, min_height_index + 1, end);  
  
    return std::max({cur, left, right});  
  }  
  
public:  
  int largestRectangleArea(vec<int> heights) {  
    return dfs(heights, 0, heights.size() - 1);  
  }  
};
```