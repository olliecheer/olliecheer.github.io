---
tags:
  - linked_list
  - sum
  - carry
---
![[problems/pictures/Pasted image 20241012194520.png]]
![[problems/pictures/Pasted image 20241012194531.png]]


```c++
struct ListNode {
    int val;
    ListNode* next;
};

class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode dummy{};
        ListNode* cur = &dummy;
        int carry = 0;

        while (l1 || l2) {
            int sum = carry;
            if (l1) {
                sum += l1->val;
                l1 = l1->next;
            }

            if (l2) {
                sum += l2->val;
                l2 = l2->next;
            }

            cur->next = new ListNode{sum % 10};
            cur = cur->next;
            carry = sum / 10;
        }

        if (carry)
            cur->next = new ListNode{carry};

        return dummy.next;
    }
};
```