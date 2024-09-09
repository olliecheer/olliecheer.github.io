---
tags:
  - stack
---
![[problems/pictures/Pasted image 20240910012346.png]]
![[problems/pictures/Pasted image 20240910012353.png]]


```c++
class CustomStack {  
  int max_size;  
  vec<int> buffer;  
  std::stack<int> stk;  
  
public:  
  CustomStack(int maxSize) : max_size{maxSize}, buffer(maxSize) {}  
  
  void push(int x) {  
    if (stk.size() < max_size)  
      stk.push(x);  
  }  
  
  int pop() {  
    int i = stk.size() - 1;  
    if (i < 0)  
      return -1;  
    if (i > 0)  
      buffer[i - 1] += buffer[i];  
  
    int res = stk.top() + buffer[i];  
    buffer[i] = 0;  
    return res;  
  }  
  
  void increment(int k, int val) {  
    int i = std::min(k, (int)stk.size()) - 1;  
    if (i >= 0)  
      buffer[i] += val;  
  }  
};
```