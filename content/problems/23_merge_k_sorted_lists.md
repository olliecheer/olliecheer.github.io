---
tags:
  - linked_list
  - sort
  - priority_queue
  - partition_merge
---
![[pictures/Pasted image 20241012195425.png]]
![[pictures/Pasted image 20241012195435.png]]


```c++
struct ListNode {
  int val;
  ListNode *next;
};

template <typename T> using vec = std::vector<T>;

class Solution {
  ListNode *partition(vec<ListNode *> &lists, int start, int end) {
    if (start > end)
      return nullptr;
    else if (start == end)
      return lists[start];
    else if (start < end) {
      int mid = (start + end) / 2;
      auto l1 = partition(lists, start, mid);
      auto l2 = partition(lists, mid + 1, end);
      return merge(l1, l2);
    }
  }

  ListNode *merge(ListNode *l1, ListNode *l2) {
    if (!l1)
      return l2;
    if (!l2)
      return l1;

    if (l1->val < l2->val) {
      l1->next = merge(l1->next, l2);
      return l1;
    } else {
      l2->next = merge(l1, l2->next);
      return l2;
    }
  }

public:
  ListNode *mergeKLists(vec<ListNode *> lists) {
    return partition(lists, 0, lists.size() - 1);
  }
};
```


```c++
struct ListNode {
  int val;
  ListNode *next;
};

template <typename T> using vec = std::vector<T>;

class Solution {
public:
  ListNode *mergeKLists(vec<ListNode *> &lists) {
    if (lists.empty())
      return nullptr;

    ListNode dummy{0};
    auto pq_comp = [](ListNode *a, ListNode *b) { return a->val > b->val; };

    std::priority_queue<ListNode *, vec<ListNode *>, decltype(pq_comp)> pq(
        pq_comp);

    for (ListNode *it : lists) {
      if (it)
        pq.push(it);
    }

    ListNode *cur = &dummy;
    while (!pq.empty()) {
      cur->next = pq.top();
      pq.pop();
      cur = cur->next;
      if (pq.empty())
        break;

      if (cur->next)
        pq.push(cur->next);
    }

    return dummy.next;
  }
};
```