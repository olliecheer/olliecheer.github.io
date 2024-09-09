---
tags:
  - common_ancestor
---
![[problems/pictures/Pasted image 20240910015628.png]]
![[problems/pictures/Pasted image 20240910015632.png]]

```c++
struct Node {  
  int val;  
  Node *left;  
  Node *right;  
  Node *parent;  
};  
  
class Solution {  
public:  
  Node *lowestCommonAncestor(Node *p, Node *q) {  
    std::unordered_set<Node *> st;  
    while (true) {  
      if (p && st.count(p))  
        return p;  
  
      st.insert(p);  
  
      if (q && st.count(q))  
        return q;  
  
      st.insert(q);  
  
      if (p)  
        p = p->parent;  
  
      if (q)  
        q = q->parent;  
    }  
  }  
};
```


```c++
// O(1) space complexity  
class Solution_2 {  
public:  
  Node *lowestCommonAncestor(Node *p, Node *q) {  
    auto a = p;  
    auto b = q;  
    while (a != b) {  
      a = (a ? a->parent : q);  
      b = (b ? b->parent : p);  
    }  
  
    return a;  
  }  
};
```