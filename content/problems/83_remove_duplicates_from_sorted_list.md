---
tags:
  - linked_list
  - recursion
  - iteration
---
![[problems/pictures/Pasted image 20241012201519.png]]
![[problems/pictures/Pasted image 20241012201530.png]]


```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  ListNode *deleteDuplicates(ListNode *head) {
    if (!head || !head->next)
      return head;

    head->next = deleteDuplicates(head->next);
    return head->val == head->next->val ? head->next : head;
  }
};
```


```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  ListNode *deleteDuplicates(ListNode *head) {
    auto cur = head;
    while (cur) {
      while (cur->next && cur->val == cur->next->val)
        cur->next = cur->next->next;

      cur = cur->next;
    }

    return head;
  }
};
```