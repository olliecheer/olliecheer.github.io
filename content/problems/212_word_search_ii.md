---
tags:
  - matrix
  - trie
---
![[problems/pictures/Pasted image 20241014000258.png]]
![[problems/pictures/Pasted image 20241014000312.png]]



## Skipped This Problem, fix later

```c++
struct TrieNode {  
  vec<TrieNode *> children{26};  
  bool is_word{false};  
};  
  
class Trie {  
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
  
class Solution {  
  std::set<std::string> res;  
  
  void dfs(vec<vec<char>> &board, vec<vec<bool>> &visited, std::string &str,  
           int x, int y, Trie &trie) {  
    if (x < 0 || x >= board.size() || y < 0 || y >= board[0].size())  
      return;  
  
    if (visited[x][y])  
      return;  
  
    str += board[x][y];  
    if (!trie.startsWith(str))  
      return;  
  
    if (trie.search(str))  
      res.insert(str);  
  
    visited[x][y] = true;  
  
    dfs(board, visited, str, x - 1, y, trie);  
    dfs(board, visited, str, x + 1, y, trie);  
    dfs(board, visited, str, x, y - 1, trie);  
    dfs(board, visited, str, x, y + 1, trie);  
  
    visited[x][y] = false;  
  }  
  
public:  
  vec<std::string> findWords(vec<vec<char>> &board, vec<std::string> &words) {  
    int M = board.size(), N = board[0].size();  
  
    Trie trie;  
    for (auto &&w : words)  
      trie.insert(w);  
  
    vec<vec<bool>> visited(M, vec<bool>(N));  
  
    for (int i = 0; i < M; i++)  
      for (int j = 0; j < N; j++) {  
        std::string tmp;  
        dfs(board, visited, tmp, i, j, trie);  
      }  
  
    return {res.begin(), res.end()};  
  }  
};
```