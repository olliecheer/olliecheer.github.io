---
tags:
---
![[problems/pictures/Pasted image 20240909223608.png]]

```c++
class Solution {  
  struct TrieNode {  
    bool is_word;  
    vec<TrieNode *> children;  
  };  
  
  TrieNode *root;  
  
  bool search(std::string &word, int index, int count) {  
    if (index == word.size() && count > 1)  
      return true;  
  
    auto cur = root;  
    for (int i = index; i < word.size(); i++) {  
      if (cur->children[word[i] - 'a'] == nullptr)  
        return false;  
  
      cur = cur->children[word[i] - 'a'];  
  
      if (cur->is_word && search(word, i + 1, count + 1))  
        return true;  
    }  
  
    return false;  
  }  
  
  void addWord(std::string &word) {  
    auto cur = root;  
    for (char c : word) {  
      if (!cur->children[c - 'a'])  
        cur->children[c - 'a'] = new TrieNode{};  
  
      cur = cur->children[c - 'a'];  
    }  
  
    cur->is_word = true;  
  }  
  
public:  
  vec<std::string> findAllConcatenatedWordsInADict(vec<std::string> &words) {  
    vec<std::string> res;  
    root = new TrieNode{};  
  
    for (auto &&it : words)  
      addWord(it);  
  
    for (auto &&it : words)  
      if (search(it, 0, 0))  
        res.push_back(it);  
  
    return res;  
  }  
};
```