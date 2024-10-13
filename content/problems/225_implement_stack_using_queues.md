---
tags:
  - stack
  - queue
---
![[pictures/Pasted image 20241014000817.png]]
![[pictures/Pasted image 20241014000829.png]]



```c++
// push O(n)  
class MyStack {
  std::queue<int> q1, q2;

public:
  void push(int x) {
    if (q1.empty())
      q1.push(x);
    while (!q2.empty()) {
      q1.push(q2.front());
      q2.pop();
    }

    while (!q1.empty()) {
      q2.push(q1.front());
      q1.pop();
    }
  }

  int pop() {
    int res = q2.front();
    q2.pop();
    return res;
  }

  int top() { return q2.front(); }

  bool empty() { return q1.empty() && q2.empty(); }
};
```

```c++
// pop O(n)  
class MyStack {
  std::queue<int> q1, q2;
  int front;

public:
  void push(int x) {
    q1.push(x);
    front = x;
  }

  int pop() {
    while (q1.size() > 1) {
      front = q1.front();
      q1.pop();
      q2.push(front);
    }

    int value = q1.front();
    std::swap(q1, q2);

    return value;
  }

  int top() { return front; }

  bool empty() { return q1.empty() && q2.empty(); }
};
```

```c++
class MyStack {
  std::queue<int> q;

public:
  void push(int x) {
    std::queue<int> tmp;
    tmp.push(x);
    while (!q.empty()) {
      tmp.push(q.front());
      q.pop();
    }
    std::swap(tmp, q);
  }

  int pop() {
    int res = q.front();
    q.pop();
    return res;
  }

  int top() { return q.front(); }

  bool empty() { return q.empty(); }
};
```