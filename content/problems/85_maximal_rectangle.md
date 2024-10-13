---
tags:
  - matrix
  - monostack
  - dfs
---
![[pictures/Pasted image 20241013231531.png]]
![[pictures/Pasted image 20241013231549.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int largestRectangleArea(vec<int> &heights) {
    std::stack<int> stk;
    int res = 0;
    for (int i = 0; i < heights.size(); i++) {
      while (!stk.empty() && heights[i] <= heights[stk.top()]) {
        int prev_height = heights[stk.top()];
        stk.pop();
        int width = i - (stk.empty() ? 0 : stk.top() + 1);
        res = std::max(res, prev_height * width);
      }
      stk.push(i);
    }

    while (!stk.empty()) {
      int prev_height = heights[stk.top()];
      stk.pop();
      int width = heights.size() - (stk.empty() ? 0 : stk.top() + 1);
      res = std::max(res, prev_height * width);
    }
    return res;
  }

public:
  int maximalRectangle(vec<vec<char>> matrix) {
    int M = matrix.size(), N = matrix[0].size();
    vec<int> heights(N);
    int res = 0;
    for (int i = 0; i < M; i++) {
      for (int j = 0; j < N; j++) {
        if (matrix[i][j] == '0')
          heights[j] = 0;
        else
          heights[j]++;
      }
      res = std::max(res, largestRectangleArea(heights));
    }

    return res;
  }
};
```