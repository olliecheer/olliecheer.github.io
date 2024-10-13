---
tags:
  - trie
---
![[pictures/Pasted image 20241014000025.png]]
![[pictures/Pasted image 20241014000035.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Trie {
  struct TrieNode {
    vec<TrieNode *> children{26};
    bool is_word{false};
  };
  
  TrieNode *root;

public:
  Trie() { root = new TrieNode{}; }

  void insert(std::string word) {
    auto node = root;
    for (char c : word) {
      if (node->children[c - 'a'] == nullptr)
        node->children[c - 'a'] = new TrieNode{};

      node = node->children[c - 'a'];
    }
    node->is_word = true;
  }

  bool search(std::string word) {
    auto node = root;
    for (char c : word) {
      if (node->children[c - 'a'] == nullptr)
        return false;

      node = node->children[c - 'a'];
    }
    return node->is_word;
  }

  bool startsWith(std::string prefix) {
    auto node = root;
    for (char c : prefix) {
      if (node->children[c - 'a'] == nullptr)
        return false;

      node = node->children[c - 'a'];
    }

    return true;
  }
};
```