---
tags:
  - linked_list
---
![[pictures/Pasted image 20241013234258.png]]
![[pictures/Pasted image 20241013234307.png]]



```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  bool hasCycle(ListNode *head) {
    ListNode *slow = head, *fast = head;
    while (fast && fast->next) {
      slow = slow->next;
      fast = fast->next->next;
      if (slow == fast)
        return true;
    }

    return false;
  }
};
```