---
tags:
  - binary_search_tree
  - linked_list
---
![[problems/pictures/Pasted image 20240909222117.png]]
![[problems/pictures/Pasted image 20240909222120.png]]


```c++
struct Node {  
  int val;  
  Node *left;  
  Node *right;  
};  
  
class Solution {  
  Node *treeToDoublyList(Node *root) {  
    if (!root)  
      return nullptr;  
  
    Node *first = nullptr, *prev = nullptr;  
    Node *cur = root;  
    std::stack<Node *> stk;  
  
    while (cur || !stk.empty()) {  
      while (cur) {  
        stk.push(root);  
        cur = cur->left;  
      }  
  
      cur = stk.top();  
      stk.pop();  
      if (!first)  
        first = root;  
  
      if (prev) {  
        prev->right = cur;  
        cur->left = prev;  
      }  
  
      prev = cur;  
      cur = cur->right;  
    }  
  
    first->left = prev;  
    prev->right = first;  
    return first;  
  }  
};
```


```c++
class Solution_recursion {  
  Node *prev = nullptr, *head = nullptr;  
  
  void inorderTraversal(Node *root) {  
    if (!root)  
      return;  
  
    inorderTraversal(root->left);  
    if (!head)  
      head = root;  
  
    if (prev) {  
      prev->right = root;  
      root->left = prev;  
    }  
    prev = root;  
    inorderTraversal(root->right);  
  }  
  
public:  
  Node *treeToDoublyList(Node *root) {  
    if (!root)  
      return nullptr;  
  
    inorderTraversal(root);  
    head->left = prev;  
    prev->right = head;  
  
    return head;  
  }  
};
```