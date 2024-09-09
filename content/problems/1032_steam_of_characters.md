---
tags:
  - data_stream
  - trie
---
![[problems/pictures/Pasted image 20240910003814.png]]
![[problems/pictures/Pasted image 20240910003823.png]]


```c++
class StreamChecker {  
  struct TrieNode {  
    bool is_word;  
    vec<TrieNode *> children{26};  
  };  
  
  TrieNode *root;  
  std::string s;  
  
  void createTrie(vec<std::string> &words) {  
    for (auto &&it : words) {  
      auto cur = root;  
      int N = it.size();  
      for (int i = N; i >= 0; i--) {  
        char c = s[i];  
        if (!cur->children[c - 'a'])  
          cur->children[c - 'a'] = new TrieNode{};  
  
        cur = cur->children[c - 'a'];  
      }  
  
      cur->is_word = true;  
    }  
  }  
  
public:  
  explicit StreamChecker(vec<std::string> &words) : root{new TrieNode{}} {  
    createTrie(words);  
  }  
  
  bool query(char letter) {  
    s.push_back(letter);  
    TrieNode *cur = root;  
  
    for (int i = s.size() - 1; i >= 0 && cur; i--) {  
      char c = s[i];  
      cur = cur->children[c - 'a'];  
      if (cur && cur->is_word)  
        return true;  
    }  
  
    return false;  
  }  
};
```