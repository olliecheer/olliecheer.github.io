---
tags:
  - cache
---
![[problems/pictures/Pasted image 20240908181452.png]]
![[problems/pictures/Pasted image 20240908181502.png]]

```c++
template <typename T> using vec = std::vector<T>;

class LRUCache {
  struct Node {
    int key;
    int value{};
    Node *prev{};
    Node *next{};

    void detach() {
      if (prev)
        prev->next = this->next;

      if (next)
        next->prev = this->prev;

      this->prev = nullptr;
      this->next = nullptr;
    }

    void insert_after(Node *node) {
      this->next = node->next;
      this->prev = node;

      if (node->next)
        node->next->prev = this;

      node->next = this;
    }
  };

  int capacity_;
  int size_;
  Node *head;
  Node *tail;
  std::unordered_map<int, Node *> mp;

public:
  LRUCache(int capacity)
      : capacity_{capacity}, size_{}, head{new Node{}}, tail{new Node{}} {
    head->next = tail;
    tail->prev = head;
  }

  int get(int key) {
    auto it = mp.find(key);
    if (it == mp.end())
      return -1;

    it->second->detach();
    it->second->insert_after(head);

    return it->second->value;
  }

  void put(int key, int value) {
    auto it = mp.find(key);
    if (it == mp.end()) {
      auto node = new Node{key, value};
      mp[key] = node;
      node->insert_after(head);
    } else {
      it->second->value = value;
      it->second->detach();
      it->second->insert_after(head);
    }

    if (mp.size() > capacity_) {
      auto node = tail->prev;
      node->detach();
      mp.erase(node->key);
      delete node;
    }
  }
};
```