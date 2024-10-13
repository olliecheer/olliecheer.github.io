---
tags:
---
![[pictures/Pasted image 20241014000215.png]]
![[pictures/Pasted image 20241014000224.png]]



```c++
template <typename T> using vec = std::vector<T>;

class WordDictionary {
  struct TrieNode {
    bool is_word{};
    vec<TrieNode *> children{26};
  };

  TrieNode *root{new TrieNode};

  bool helper(std::string &word, int pos, TrieNode *node) {
    if (pos == word.size())
      return node->is_word;

    char c = word[pos];
    if (c != '.')
      return node->children[c - 'a'] &&
             helper(word, pos + 1, node->children[c - 'a']);

    for (int i = 0; i < 26; i++)
      if (node->children[i] && helper(word, pos + 1, node->children[i]))
        return true;

    return false;
  }

public:
  void addWord(std::string word) {
    auto cur = root;
    for (char c : word) {
      if (!cur->children[c - 'a'])
        cur->children[c - 'a'] = new TrieNode{};

      cur = cur->children[c - 'a'];
    }

    cur->is_word = true;
  }

  bool search(std::string word) { return helper(word, 0, root); }
};
```