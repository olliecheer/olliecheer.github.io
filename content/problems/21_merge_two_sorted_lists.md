---
tags:
  - linked_list
  - sort
  - recursion
---
![[problems/pictures/Pasted image 20240907222625.png]]
![[problems/pictures/Pasted image 20240907222634.png]]


### iteration
```c++
struct ListNode {  
  int val;  
  ListNode *next;  
};  
  
class Solution {  
public:  
  ListNode *mergeTwoLists(ListNode *l1, ListNode *l2) {  
    ListNode dummy{};  
  
    auto cur = &dummy;  
  
    while (l1 != nullptr && l2 != nullptr) {  
      if (l1->val < l2->val) {  
        cur->next = l1;  
        l1 = l1->next;  
      } else {  
        cur->next = l2;  
        l2 = l2->next;  
      }  
      cur = cur->next;  
    }  
  
    if (l1) {  
      cur->next = l1;  
    } else {  
      cur->next = l2;  
    }  
  
    return dummy.next;  
  }  
};
```


### recursion
```c++
class Solution_Recursion {  
public:  
  ListNode *mergeTwoLists(ListNode *l1, ListNode *l2) {  
    if (!l1)  
      return l2;  
  
    if (!l2)  
      return l1;  
  
    if (l1->val < l2->val) {  
      l1->next = mergeTwoLists(l1->next, l2);  
      return l1;  
    } else {  
      l2->next = mergeTwoLists(l1, l2->next);  
      return l2;  
    }  
  }  
};
```
