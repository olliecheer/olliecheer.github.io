---
tags:
  - random
  - reservoir_sampling
---
![[problems/pictures/Pasted image 20241014005110.png]]
![[problems/pictures/Pasted image 20241014005119.png]]



### Reservoir Sampling

```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
  ListNode *head;

public:
  explicit Solution(ListNode *_head) : head(_head) {}

  // P = 1/m * m/(m+1) * (m+1)/(m+2) * ... * (n-1)/n = 1/n
  int getRandom() {
    int res = -1, count = 1;
    for (auto cur = head; cur; cur = cur->next) {
      if (rand() % count == 0)
        res = cur->val;

      count++;
    }

    return res;
  }
};
```