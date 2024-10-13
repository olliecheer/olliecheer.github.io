---
tags:
  - linked_list
  - reverse
  - recursion
  - iteration
---
![[pictures/Pasted image 20241012195455.png]]
![[pictures/Pasted image 20241012195507.png]]


```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  ListNode *reverseKGroup(ListNode *head, int k) {
    ListNode *node = head;
    int count = 0;
    for (; count < k; count++) {
      if (!node)
        return head;

      node = node->next;
    }

    auto prev = reverseKGroup(node, k);
    for (; count > 0; count--) {
      auto next = head->next;
      head->next = prev;
      prev = head;
      head = next;
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
  int countLength(ListNode *cur) {
    int res = 0;
    while (cur) {
      cur = cur->next;
      res++;
    }

    return res;
  }

  ListNode *reverseBetween(ListNode *head, int m, int n) {
    ListNode dummy_head{-1, head};
    ListNode *prev = &dummy_head;
    ListNode *cur = head;

    int idx = 0;
    for (; idx < m; idx++) {
      prev = cur;
      cur = cur->next;
    }

    ListNode *p = prev;
    for (; idx < n; idx++) {
      auto next = cur->next;
      cur->next = p;
      p = cur;
      cur = next;
    }

    prev->next->next = cur;
    prev->next = p;

    return dummy_head.next;
  }

public:
  ListNode *reverseKGroup(ListNode *head, int k) {
    int N = countLength(head);
    int i = 0;
    while (i + k <= N) {
      head = reverseBetween(head, i, i + k);
      i += k;
    }

    return head;
  }
};
```