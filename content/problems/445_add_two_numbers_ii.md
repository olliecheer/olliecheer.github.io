---
tags:
---
![[problems/pictures/Pasted image 20240909222641.png]]
![[problems/pictures/Pasted image 20240909222648.png]]

```c++
struct ListNode {
  int val;
  ListNode *next;
};

class Solution {
public:
  ListNode *addTwoNumbers(ListNode *l1, ListNode *l2) {
    std::stack<int> stk1, stk2;
    while (l1) {
      stk1.push(l1->val);
      l1 = l1->next;
    }

    while (l2) {
      stk2.push(l2->val);
      l2 = l2->next;
    }

    ListNode *res = nullptr;
    int carry = 0;

    while (!stk1.empty() || !stk2.empty() || carry != 0) {
      int v1 = 0, v2 = 0;
      if (!stk1.empty()) {
        v1 = stk1.top();
        stk1.pop();
      }

      if (!stk2.empty()) {
        v2 = stk2.top();
        stk2.pop();
      }

      int sum = v1 + v2 + carry;
      carry = sum / 10;

      ListNode *cur = new ListNode{sum % 10};
      cur->next = res;
      res = cur;
    }

    return res;
  }
};
```