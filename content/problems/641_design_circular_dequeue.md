---
tags:
  - queue
---
![[problems/pictures/Pasted image 20241011083506.png]]
![[problems/pictures/Pasted image 20241011083517.png]]


```c++
template <typename T> using vec = std::vector<T>;

class MyCircularDeque {
  vec<int> data;
  int front = 0;
  int rear = -1;
  int size = 0;
  int capacity;

public:
  explicit MyCircularDeque(int k) : capacity(k), data(k) {}

  bool insertFront(int value) {
    if (isFull())
      return false;

    front = (front - 1 + capacity) % capacity;
    data[front] = value;
    size++;
    if (size == 1)
      rear = front;

    return true;
  }

  bool insertLast(int value) {
    if (isFull())
      return false;

    rear = (rear + 1) % capacity;
    data[rear] = value;
    size++;
    return true;
  }

  bool deleteFront() {
    if (isEmpty())
      return false;

    front = (front + 1) % capacity;
    size--;
    return true;
  }

  bool deleteLast() {
    if (isEmpty())
      return false;

    rear = (rear - 1 + capacity) % capacity;
    size--;
    return true;
  }

  int getFront() { return isEmpty() ? -1 : data[front]; }

  int getRear() { return isEmpty() ? -1 : data[rear]; }

  bool isEmpty() { return size == 0; }

  bool isFull() { return size == capacity; }
};
```
