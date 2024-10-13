---
tags:
  - stack
  - queue
---
![[pictures/Pasted image 20241014001242.png]]
![[pictures/Pasted image 20241014001251.png]]



```c++
class MyQueue {
  std::stack<int> ss1;
  std::stack<int> ss2;
  int front;

public:
  MyQueue() {}

  void push(int x) {
    if (ss1.empty()) {
      front = x;
    }
    ss1.push(x);
  }

  int pop() {
    if (ss2.empty()) {
      while (!ss1.empty()) {
        ss2.push(ss1.top());
        ss1.pop();
      }
    }
    auto tmp = ss2.top();
    ss2.pop();
    return tmp;
  }

  int peek() {
    if (!ss2.empty()) {
      return ss2.top();
    }
    return front;
  }

  bool empty() { return ss1.empty() && ss2.empty(); }
};
```