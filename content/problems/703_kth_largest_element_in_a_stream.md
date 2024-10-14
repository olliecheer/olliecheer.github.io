---
tags:
  - data_stream
  - priority_queue
---
![[problems/pictures/Pasted image 20241011085331.png]]
![[problems/pictures/Pasted image 20241011085343.png]]
![[problems/pictures/Pasted image 20241011085353.png]]


```c++
template <typename T> using vec = std::vector<T>;

class KthLargest {
  std::priority_queue<int, vec<int>, std::greater<>> pq;
  int k;

public:
  KthLargest(int k, vec<int> &nums) {
    this->k = k;
    for (int it : nums)
      add(it);
  }

  int add(int val) {
    if (pq.size() < k || val > pq.top())
      pq.push(val);

    if (pq.size() > k)
      pq.pop();

    return pq.top();
  }
};
```
