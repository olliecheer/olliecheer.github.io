---
tags:
  - linked_list
---
![[problems/pictures/Pasted image 20240910003613.png]]
![[problems/pictures/Pasted image 20240910003621.png]]

```c++
struct ListNode {  
  int val;  
  ListNode *next;  
};  
  
class Solution {  
  vec<int> nextLargerNodes(ListNode *head) {  
    vec<int> nums;  
    for (auto cur = head; cur; cur = cur->next)  
      nums.push_back(cur->val);  
  
    int N = nums.size();  
    vec<int> res(N);  
  
    std::stack<int> stk;  
    for (int i = N - 1; i >= 0; i--) {  
      while (!stk.empty() && nums[i] >= stk.top())  
        stk.pop();  
  
      res[i] = (stk.empty() ? 0 : stk.top());  
      stk.push(nums[i]);  
    }  
  
    return res;  
  }  
};
```