---
tags:
  - data_stream
  - trie
  - ac_automaton
---
![[problems/pictures/Pasted image 20241013203954.png]]
![[problems/pictures/Pasted image 20241013204022.png]]



### Automaton

```c++
template <typename T> using vec = std::vector<T>;

struct TrieNode {
  vec<TrieNode *> children;
  bool isEnd;
  TrieNode *fail;
  TrieNode() {
    this->children = vec<TrieNode *>(26, nullptr);
    this->isEnd = false;
    this->fail = nullptr;
  }
};

class StreamChecker {
public:
  TrieNode *root;
  TrieNode *temp;
  StreamChecker(vec<std::string> &words) {
    root = new TrieNode();
    for (std::string &word : words) {
      TrieNode *cur = root;
      for (int i = 0; i < word.size(); i++) {
        int index = word[i] - 'a';
        if (cur->children[index] == nullptr) {
          cur->children[index] = new TrieNode();
        }
        cur = cur->children[index];
      }
      cur->isEnd = true;
    }
    root->fail = root;
    std::queue<TrieNode *> q;
    for (int i = 0; i < 26; i++) {
      if (root->children[i] != nullptr) {
        root->children[i]->fail = root;
        q.emplace(root->children[i]);
      } else
        root->children[i] = root;
    }
    while (!q.empty()) {
      TrieNode *node = q.front();
      q.pop();
      node->isEnd = node->isEnd || node->fail->isEnd;
      for (int i = 0; i < 26; i++) {
        if (node->children[i] != nullptr) {
          node->children[i]->fail = node->fail->children[i];
          q.emplace(node->children[i]);
        } else
          node->children[i] = node->fail->children[i];
      }
    }

    temp = root;
  }

  bool query(char letter) {
    temp = temp->children[letter - 'a'];
    return temp->isEnd;
  }
};
```