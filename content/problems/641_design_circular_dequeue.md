---
tags:
  - queue
---
![[problems/pictures/Pasted image 20240909230536.png]]

```c++
class MyCircularDeque {  
  int *data;  
  int capacity;  
  int len;  
  int front{};  
  int back{};  
  
public:  
  MyCircularDeque(int k) : data{new int[k + 1]}, capacity{k}, len{k + 1} {}  
  
  bool insertFront(int value) {  
    if (isFull())  
      return false;  
  
    front = (len + front - 1) % len;  
    data[front] = value;  
    return true;  
  }  
  
  bool insertLast(int value) {  
    if (isFull())  
      return false;  
  
    data[back] = value;  
    back = (back + 1) % len;  
    return true;  
  }  
  
  bool deleteFront() {  
    if (isEmpty())  
      return false;  
  
    front = (front + 1) % len;  
    return true;  
  }  
  
  bool deleteLast() {  
    if (isEmpty())  
      return fa
```