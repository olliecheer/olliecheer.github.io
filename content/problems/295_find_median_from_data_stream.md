---
tags:
  - quick_select
---
![[problems/pictures/Pasted image 20240908225934.png]]
![[problems/pictures/Pasted image 20240908225944.png]]


```c++
class Solution {  
  std::priority_queue<int, vec<int>, std::less<>>  
      max_heap; // store the smaller half  
  std::priority_queue<int, vec<int>, std::greater<>>  
      min_heap; // store the larger half  
  
public:  
  void addNum(int num) {  
    max_heap.push(num);  
    min_heap.push(max_heap.top());  
    max_heap.pop();  
  
    if (min_heap.size() > max_heap.size()) {  
      max_heap.push(min_heap.top());  
      min_heap.pop();  
    }  
  }  
  
  double findMedian() {  
    if (max_heap.size() == min_heap.size()) {  
      return (max_heap.top() + min_heap.top()) / 2.0;  
    } else {  
      return max_heap.top();  
    }  
  }  
};
```