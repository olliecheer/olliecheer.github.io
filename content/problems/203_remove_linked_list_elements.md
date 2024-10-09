---
tags:
  - linked_list
---
![[problems/pictures/Pasted image 20240908184758.png]]

```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  ListNode *removeElements(ListNode *head, int val) {
    ListNode dummy{-1, head};
    auto cur = &dummy;

    while (cur->next) {
      if (cur->next->val == val)
        cur->next = cur->next->next;
      else
        cur = cur->next;
    }

    return dummy.next;
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
  ListNode *removeElements(ListNode *head, int val) {
    if (!head)
      return nullptr;

    head->next = removeElements(head->next, val);
    return head->val == val ? head->next : head;
  }
};
```