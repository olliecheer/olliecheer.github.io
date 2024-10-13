---
tags:
  - common_ancestor
---
![[pictures/Pasted image 20241013225525.png]]
![[pictures/Pasted image 20241013225540.png]]



```c++
struct Node {
  int val;
  Node *left;
  Node *right;
  Node *parent;
};

template <typename T> using vec = std::vector<T>;

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
struct Node {
  int val;
  Node *left;
  Node *right;
  Node *parent;
};

template <typename T> using vec = std::vector<T>;

class Solution {
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