---
tags:
  - linked_list
---
![[problems/pictures/Pasted image 20240908180814.png]]
![[problems/pictures/Pasted image 20240908180823.png]]
```c++
struct ListNode {  
  int val;  
  ListNode *next;  
};  
  
class Solution {  
public:  
  bool hasCycle(ListNode *head) {  
    ListNode *slow = head, *fast = head;  
    while (!fast && !fast->next) {  
      slow = slow->next;  
      fast = fast->next->next;  
      if (slow == fast)  
        return true;  
    }  
  
    return false;  
  }  
};
```