---
tags:
  - linked_list
---
![[pictures/Pasted image 20241013234338.png]]
![[pictures/Pasted image 20241013234401.png]]



```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  ListNode *detectCycle(ListNode *head) {
    ListNode *slow = head, *fast = head;
    while (fast && fast->next) {
      fast = fast->next->next;
      slow = slow->next;
      if (fast == slow) {
        fast = head;
        while (slow != fast) {
          fast = fast->next;
          slow = slow->next;
        }
        return slow;
      }
    }

    return nullptr;
  }
};
```