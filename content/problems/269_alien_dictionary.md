---
tags:
  - dfs
  - bfs
---
// vip


## BFS

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  std::unordered_map<char, vec<char>> graph;
  std::unordered_map<char, int> indegree;
  bool valid = true;

  void build(vec<std::string> &words) {
    for (auto &&w : words) {
      for (char c : w) {
        indegree[c] = 0;
        graph[c] = {};
      }
    }

    for (int i = 0; i < words.size() - 1; i++) {
      std::string w1 = words[i], w2 = words[i + 1];
      if (w1.size() > w2.size() && w1.find(w2) == 0) {
        valid = false;
        break;
      }

      for (int j = 0; j < std::min(w1.size(), w2.size()); j++) {
        if (w1[j] != w2[j]) {
          graph[w1[j]].push_back(w2[j]);
          indegree[w2[j]]++;
          break;
        }
      }
    }
  }

public:
  std::string alienOrder(vec<std::string> &words) {
    build(words);
    if (!valid)
      return "";

    std::string s;
    std::queue<char> q;
    for (auto &&it : indegree) {
      if (indegree[it.first] == 0)
        q.push(it.first);
    }

    while (!q.empty()) {
      char c = q.front();
      q.pop();
      s.push_back(c);
      for (char neighbor : graph[c]) {
        indegree[neighbor]--;
        if (indegree[neighbor] == 0)
          q.push(neighbor);
      }
    }

    return s.size() < indegree.size() ? "" : s;
  }
};
```

## DFS

```c++
template <typename T> using vec = std::vector<T>;

class Solution {

  std::unordered_map<char, vec<char>> graph;
  std::unordered_map<char, int> indegree;
  bool valid = true;

  void build(vec<std::string> &words) {
    for (auto &&w : words) {
      for (char c : w) {
        indegree[c] = 0;
        graph[c] = {};
      }
    }

    for (int i = 0; i < words.size() - 1; i++) {
      std::string w1 = words[i], w2 = words[i + 1];
      if (w1.size() > w2.size() && w1.find(w2) == 0)
        valid = false;

      for (int j = 0; j < std::min(w1.size(), w2.size()); j++) {
        if (w1[j] != w2[j]) {
          graph[w1[j]].push_back(w2[j]);
          indegree[w2[j]]++;
          break;
        }
      }
    }
  }

  std::string s;
  std::unordered_map<char, int> visited;

  void dfs(char c) {
    visited[c] = 1;
    for (char neighbor : graph[c]) {
      if (visited[neighbor] == 0)
        dfs(neighbor);
      else if (visited[neighbor] == 1)
        valid = false;
    }
    s.push_back(c);
    visited[c] = 2;
  }

public:
  std::string alienOrder(vec<std::string> &words) {
    build(words);

    for (auto &&it : graph) {
      char c = it.first;
      visited[c] = 0;
    }

    for (auto &&it : graph) {
      char c = it.first;
      if (visited[c] == 0)
        dfs(c);
    }

    if (!valid || s.size() < graph.size())
      return "";

    std::reverse(s.begin(), s.end());
    return s;
  }
};
```