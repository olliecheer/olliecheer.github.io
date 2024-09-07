---
tags:
  - linked_list
---


![[problems/pictures/Pasted image 20240907234912.png]]
![[problems/pictures/Pasted image 20240907234933.png]]

```c++
struct ListNode {  
  int val;  
  ListNode *next;  
};  
  
class Solution {  
public:  
  ListNode *deleteDuplicates(ListNode *head) {  
    ListNode dummy{-1, head};  
    auto prev = &dummy, cur = head;  
    while (cur && cur->next) {  
      if (cur->val == cur->next->val) {  
        int tmp = cur->val;  
        while (cur && tmp == cur->val)  
          cur = cur->next;  
        prev->next = cur;  
      } else {  
        prev = prev->next;  
        cur = cur->next;  
      }  
    }  
  
    return dummy.next;  
  }  
};
```