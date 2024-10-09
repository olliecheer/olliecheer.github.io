---
tags:
  - linked_list
---
![[problems/pictures/Pasted image 20240908182144.png]]
![[problems/pictures/Pasted image 20240908182156.png]]
![[problems/pictures/Pasted image 20240908182206.png]]

```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
    ListNode *a = headA;
    ListNode *b = headB;

    while (a != b) {
      if (a)
        a = a->next;
      else
        a = headB;

      if (b)
        b = b->next;
      else
        b = headA;
    }

    return a;
  }
};
```