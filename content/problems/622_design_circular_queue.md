---
tags:
  - queue
---
![[problems/pictures/Pasted image 20240909230440.png]]
![[problems/pictures/Pasted image 20240909230447.png]]
```c++
class MyCircularQueue {  
private:  
  vec<int> arr;  
  int front;  
  int rear;  
  int capacity;  
  
public:  
  explicit MyCircularQueue(int k) {  
    capacity = k + 1;  
    arr.assign(capacity, 0);  
  
    front = 0;  
    rear = 0;  
  }  
  
  bool enQueue(int value) {  
    if (isFull()) {  
      return false;  
    }  
    arr[rear] = value;  
    rear = (rear + 1) % capacity;  
    return true;  
  }  
  
  bool deQueue() {  
    if (isEmpty()) {  
      return false;  
    }  
    front = (front + 1) % capacity;  
    return true;  
  }  
  
  int Front() {  
    if (isEmpty()) {  
      return -1;  
    }  
    return arr[front];  
  }  
  
  int Rear() {  
    if (isEmpty()) {  
      return -1;  
    }  
    return arr[(rear - 1 + capacity) % capacity];  
  }  
  
  bool isEmpty() { return front == rear; }  
  
  bool isFull() { return (rear + 1) % capacity == front; }  
};
```