---
tags:
  - linked_list
  - sort
  - recursion
---
![[pictures/Pasted image 20241012195306.png]]
![[pictures/Pasted image 20241012195322.png]]
![[pictures/Pasted image 20241012195330.png]]


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

    while (l1 && l2) {
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
class Solution {
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
