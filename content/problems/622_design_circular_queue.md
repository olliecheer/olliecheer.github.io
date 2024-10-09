---
tags:
  - queue
---
![[problems/pictures/Pasted image 20240909230440.png]]
![[problems/pictures/Pasted image 20240909230447.png]]
```c++
template <typename T> using vec = std::vector<T>;

class MyCircularQueue {
private:
  vec<int> data;
  int front;
  int rear;
  int capacity;

public:
  explicit MyCircularQueue(int k) {
    capacity = k + 1;
    data = vec<int>(capacity);

    front = 0;
    rear = 0;
  }

  bool enQueue(int value) {
    if (isFull())
      return false;

    data[rear] = value;
    rear = (rear + 1) % capacity;
    return true;
  }

  bool deQueue() {
    if (isEmpty())
      return false;

    front = (front + 1) % capacity;
    return true;
  }

  int Front() {
    if (isEmpty())
      return -1;

    return data[front];
  }

  int Rear() {
    if (isEmpty())
      return -1;

    return data[(rear - 1 + capacity) % capacity];
  }

  bool isEmpty() { return front == rear; }

  bool isFull() { return (rear + 1) % capacity == front; }
};
```
