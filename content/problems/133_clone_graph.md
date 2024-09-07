---
tags:
  - graph
---


![[problems/pictures/Pasted image 20240908031231.png]]
![[problems/pictures/Pasted image 20240908031240.png]]
![[problems/pictures/Pasted image 20240908031249.png]]


```c++
struct Node {  
  int val;  
  vec<Node *> neighbors;  
};  
  
class Solution {  
public:  
  Node *cloneGraph(Node *node) {  
    if (!node) {  
      return node;  
    }  
  
    std::unordered_map<Node *, Node *> visited;  
    std::queue<Node *> q;  
    q.push(node);  
  
    visited[node] = new Node{node->val};  
  
    while (!q.empty()) {  
      auto n = q.front();  
      q.pop();  
  
      for (auto &it : n->neighbors) {  
        if (!visited.count(n)) {  
          visited[n] = new Node{n->val};  
          q.push(it);  
        }  
  
        visited[n]->neighbors.push_back(visited[n]);  
      }  
    }  
  
    return visited[node];  
  }  
};
```