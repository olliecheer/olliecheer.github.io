---
tags:
  - linked_list
  - reverse
---

![[problems/pictures/Pasted image 20240908023302.png]]

```c++
struct ListNode {  
  int val;  
  ListNode *next;  
};  
  
class Solution {  
public:  
  ListNode *reverseBetween(ListNode *head, int left, int right) {  
    ListNode dummy{-1, head};  
    ListNode *left_ptr = &dummy;  
    ListNode *right_ptr = &dummy;  
  
    for (int i = 0; i < left - 1; i++)  
      left_ptr = left_ptr->next;  
  
    for (int i = 0; i < right + 1; i++)  
      right_ptr = right_ptr->next;  
  
    ListNode *prev = left_ptr;  
    ListNode *cur = prev->next;  
  
    while (cur != right_ptr) {  
      auto next = cur->next;  
      cur->next = prev;  
      prev = cur;  
      cur = next;  
    }  
  
    left_ptr->next->next = right_ptr;  
    left_ptr->next = prev;  
  
    return dummy.next;  
  }  
};
```
