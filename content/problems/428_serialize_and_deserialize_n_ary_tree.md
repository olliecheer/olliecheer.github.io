---
tags:
  - tree_construct
---

![[problems/pictures/Pasted image 20240909222318.png]]
![[problems/pictures/Pasted image 20240909222327.png]]
![[problems/pictures/Pasted image 20240909222331.png]]



```c++
struct Node {  
  int val;  
  vec<Node *> children;  
};  
  
class Codec {  
  void do_serialize(Node *root, vec<std::string> &tmp) {  
    if (!root)  
      return;  
  
    tmp.push_back(std::to_string(root->val));  
    tmp.push_back(std::to_string(root->children.size()));  
  
    for (auto it : root->children)  
      do_serialize(it, tmp);  
  }  
  
  Node *do_deserialize(std::queue<std::string> &q) {  
    auto tmp = q.front();  
    q.pop();  
    Node *root = new Node{std::stoi(tmp)};  
  
    tmp = q.front();  
    q.pop();  
    int sz = std::stoi(tmp);  
  
    for (int i = 0; i < sz; i++)  
      root->children.push_back(do_deserialize(q));  
  
    return root;  
  }  
  
public:  
  std::string serialize(Node *root) {  
    vec<std::string> tmp;  
    do_serialize(root, tmp);  
  
    std::string res;  
    for (auto &&it : tmp)  
      res += it + ",";  
  
    return res;  
  }  
  
  Node *deserialize(std::string &data) {  
    if (data == "")  
      return nullptr;  
  
    std::queue<std::string> q;  
    std::stringstream ss(data);  
    std::string tmp;  
    while (std::getline(ss, tmp, ',')) {  
      if (!tmp.empty())  
        q.push(std::move(tmp));  
    }  
  
    return do_deserialize(q);  
  }  
};
```