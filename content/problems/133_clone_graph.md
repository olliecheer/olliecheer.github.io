---
tags:
  - graph
---
![[problems/pictures/Pasted image 20241013233832.png]]
![[problems/pictures/Pasted image 20241013233846.png]]
![[problems/pictures/Pasted image 20241013233858.png]]



```c++
struct Node {
  int val;
  vec<Node *> neighbors;
};

class Solution {
public:
  Node *cloneGraph(Node *node) {
    if (!node)
      return node;

    std::unordered_map<Node *, Node *> visited;
    std::queue<Node *> q;
    q.push(node);

    visited[node] = new Node{node->val};

    while (!q.empty()) {
      auto n = q.front();
      q.pop();

      for (auto &&it : n->neighbors) {
        if (!visited.count(it)) {
          visited[it] = new Node{it->val};
          q.push(it);
        }

        visited[n]->neighbors.push_back(visited[it]);
      }
    }

    return visited[node];
  }
};
```