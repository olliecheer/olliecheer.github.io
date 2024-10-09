---
tags:
  - linked_list
---
![[problems/pictures/Pasted image 20240907193722.png]]


```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  ListNode *removeNthFromEnd(ListNode *head, int n) {
    ListNode dummy{-1, head};
    auto first = &dummy, second = &dummy;
    for (int i = 1; i <= n + 1; i++)
      first = first->next;

    while (first) {
      first = first->next;
      second = second->next;
    }

    second->next = second->next->next;
    return dummy.next;
  }
};
```