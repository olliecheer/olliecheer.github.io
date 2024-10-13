---
tags:
  - linked_list
---
![[pictures/Pasted image 20241013231146.png]]


```c++
struct ListNode {
  int val;
  ListNode *next;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  ListNode *middleNode(ListNode *head) {
    auto slow = head, fast = head;

    while (fast && fast->next) {
      fast = fast->next->next;
      slow = slow->next;
    }

    return slow;
  }
};
```