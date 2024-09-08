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
    ListNode *new_head{};  
    auto cur = head;  
  
    while (cur) {  
      auto next = cur->next;  
      cur->next = new_head;  
      new_head = cur;  
      cur = next;  
    }  
  
    return new_head;  
  }  
};
```


```c++
class Solution_Recursion {  
  ListNode *reverse(ListNode *head, ListNode *new_head) {  
    if (!head)  
      return new_head;  
  
    auto next = head->next;  
    head->next = new_head;  
  
    return reverse(next, head);  
  }  
  
public:  
  ListNode *reverseList(ListNode *head) { return reverse(head, nullptr); }  
};
```