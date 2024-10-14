---
tags:
---
![[problems/pictures/Pasted image 20241014010955.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  struct TrieNode {
    bool is_word;
    vec<TrieNode *> children{26};
  };

  TrieNode *root;
  std::unordered_map<int, std::unordered_map<int, int>> mp;

  void addWord(std::string &word) {
    auto cur = root;
    for (char c : word) {
      if (!cur->children[c - 'a'])
        cur->children[c - 'a'] = new TrieNode{};

      cur = cur->children[c - 'a'];
    }

    cur->is_word = true;
  }

  bool dfs(int pos, std::string &target, int which) {
    if (mp[which][pos] == 1)
      return false;

    if (pos >= target.size())
      return true;

    auto cur = root;
    for (int i = pos; i < target.size(); i++) {
      if (!cur->children[target[i] - 'a'])
        break;

      if (cur->children[target[i] - 'a']->is_word && dfs(i + 1, target, which))
        return true;

      cur = cur->children[target[i] - 'a'];
    }

    mp[which][pos] = 1;
    return false;
  }

public:
  vec<std::string> findAllConcatenatedWordsInADict(vec<std::string> &words) {
    std::sort(words.begin(), words.end(),
              [](auto &a, auto &b) { return a.size() < b.size(); });
    vec<std::string> res;
    root = new TrieNode{};

    for (int i = 0; i < words.size(); i++) {
      if (words[i].empty())
        continue;

      if (dfs(0, words[i], i))
        res.push_back(words[i]);

      addWord(words[i]);
    }

    return res;
  }
};
```
