---
tags:
  - linked_list
  - reverse
  - recursion
  - iteration
---
![[problems/pictures/Pasted image 20240907223347.png]]
![[problems/pictures/Pasted image 20240907223355.png]]

```c++
struct ListNode {  
  int val;  
  ListNode *next;  
};  
  
class Solution_recursive {  
public:  
  ListNode *reverseKGroup(ListNode *head, int k) {  
    ListNode *node = head;  
    int count = 0;  
    while (count < k) {  
      if (!node)  
        return head;  
  
      node = node->next;  
      count++;  
    }  
  
    auto prev = reverseKGroup(node, k);  
    while (count > 0) {  
      count--;  
  
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
class Solution_iterative {  
  
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
  
    int i = 1;  
    while (i < m) {  
      prev = cur;  
      cur = cur->next;  
      i++;  
    }  
  
    ListNode *p = prev;  
    while (i <= n) {  
      auto next = cur->next;  
      cur->next = p;  
      p = cur;  
      cur = next;  
      i++;  
    }  
  
    prev->next->next = cur;  
    prev->next = p;  
  
    return dummy_head.next;  
  }  
  
public:  
  ListNode *reverseKGroup(ListNode *head, int k) {  
    int N = countLength(head);  
    int i = 1;  
    while (i + k <= N + 1) {  
      head = reverseBetween(head, i, i + k - 1);  
      i += k;  
    }  
  
    return head;  
  }  
};
```