---
tags:
  - data_stream
  - priority_queue
---
![[problems/pictures/Pasted image 20240909232239.png]]

```c++
class KthLargest {  
  std::priority_queue<int> pq;  
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