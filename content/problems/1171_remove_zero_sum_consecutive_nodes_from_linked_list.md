---
tags:
  - linked_list
---
![[problems/pictures/Pasted image 20240910005652.png]]


```c++
struct ListNode {  
  int val;  
  ListNode *next;  
};  
  
class Solution {  
public:  
  ListNode *removeZeroSumSublists(ListNode *head) {  
    int prev_fix = 0;  
    ListNode dummy{-1, head};  
  
    std::unordered_map<int, ListNode *> mp;  
    mp[0] = &dummy;  
  
    for (ListNode *cur = &dummy; cur; cur = cur->next) {  
      prev_fix += cur->val;  
      mp[prev_fix] = cur;  
    }  
  
    prev_fix = 0;  
    for (ListNode *cur = &dummy; cur; cur = cur->next) {  
      prev_fix += cur->val;  
      cur->next = mp[prev_fix]->next;  
    }  
  
    return dummy.next;  
  }  
};
```