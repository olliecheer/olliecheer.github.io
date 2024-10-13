---
tags:
  - linked_list
---
![[pictures/Pasted image 20241013234043.png]]
![[pictures/Pasted image 20241013234058.png]]
![[pictures/Pasted image 20241013234105.png]]




```c++
class Solution {
  // struct Node {
  //   int val;
  //   Node *next;
  //   Node *random;
  // };

public:
  Node *copyRandomList(Node *head) {
    if (!head)
      return nullptr;

    for (auto node = head; node; node = node->next->next) {
      auto tmp = new Node{node->val};
      tmp->next = node->next;
      node->next = tmp;
    }

    for (auto node = head; node; node = node->next->next) {
      auto tmp = node->next;
      tmp->random = node->random ? node->random->next : nullptr;
    }

    auto res = head->next;
    for (auto node = head; node; node = node->next) {
      auto tmp = node->next;
      node->next = node->next->next;
      tmp->next = tmp->next ? tmp->next->next : nullptr;
    }

    return res;
  }
};
```