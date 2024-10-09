---
tags:
  - stack
---
![[problems/pictures/Pasted image 20240908181750.png]]


```c++
class MinStack {
  std::stack<int> stk, min_stack;

public:
  void push(int x) {
    stk.push(x);
    if (min_stack.empty() || x <= min_stack.top())
      min_stack.push(x);
  }

  void pop() {
    int top = stk.top();
    stk.pop();

    if (top == min_stack.top())
      min_stack.pop();
  }

  int top() { return stk.top(); }

  int getMin() { return min_stack.top(); }
};
```
