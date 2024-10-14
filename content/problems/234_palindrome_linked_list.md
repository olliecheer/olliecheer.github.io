---
tags:
  - palindrome
  - linked_list
---
![[problems/pictures/Pasted image 20241014001322.png]]



```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
  ListNode *endOfFirstHalf(ListNode *head) {
    ListNode *fast = head, *slow = head;
    while (fast->next && fast->next->next) {
      fast = fast->next->next;
      slow = slow->next;
    }
    return slow;
  }

  ListNode *reverse(ListNode *head) {
    ListNode *prev = nullptr;
    while (head != nullptr) {
      auto next = head->next;
      head->next = prev;
      prev = head;
      head = next;
    }
    return prev;
  }

public:
  bool isPalindrome(ListNode *head) {
    auto first_half_end = endOfFirstHalf(head);
    auto second_half_start = reverse(first_half_end->next);
    auto p1 = head;
    auto p2 = second_half_start;
    bool res = true;

    while (res && p2) {
      if (p1->val != p2->val)
        res = false;

      p1 = p1->next;
      p2 = p2->next;
    }
    first_half_end = reverse(second_half_start);
    return res;
  }
};
```