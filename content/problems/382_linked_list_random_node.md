---
tags:
  - linked_list
---
![[problems/pictures/Pasted image 20240909220412.png]]
![[problems/pictures/Pasted image 20240909220421.png]]

```c++
struct ListNode {  
  int val;  
  ListNode *next;  
};  
  
class Solution {  
  ListNode *head;  
  
public:  
  explicit Solution(ListNode *) {}  
  
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