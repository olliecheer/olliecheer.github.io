---
tags:
  - linked_list
  - reverse
---
![[problems/pictures/Pasted image 20240908184932.png]]
![[problems/pictures/Pasted image 20240908184942.png]]

```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  ListNode *reverseList(ListNode *head) {
    ListNode *prev{};
    auto cur = head;

    while (cur) {
      auto next = cur->next;
      cur->next = prev;
      prev = cur;
      cur = next;
    }

    return prev;
  }
};
```


```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
  ListNode *reverse(ListNode *head, ListNode *prev) {
    if (!head)
      return prev;

    auto next = head->next;
    head->next = prev;

    return reverse(next, head);
  }

public:
  ListNode *reverseList(ListNode *head) { return reverse(head, nullptr); }
};
```