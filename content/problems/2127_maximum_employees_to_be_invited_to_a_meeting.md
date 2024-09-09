---
tags:
  - dfs
---
![[problems/pictures/Pasted image 20240910021201.png]]
![[problems/pictures/Pasted image 20240910021212.png]]

```c++
// find circle in directed graph  
class Solution {  
  int N;  
  std::unordered_map<int, vec<int>> graph;  
  int singleMaxCycleSize = 0;  
  vec<vec<int>> paris;  
  vec<int> favorite;  
  
  std::unordered_map<int, int> max;  
  
  void dfs(int cur, vec<bool> visited, int len, int start) {  
    if (visited[cur])  
      return;  
  
    max[start] = std::max(max[start], len);  
    visited[cur] = true;  
    for (int neighbor : graph[cur]) {  
      if (!visited[neighbor])  
        dfs(neighbor, visited, len + 1, start);  
    }  
  }  
  
  void isCyclicUtil(int i, vec<bool> &visited, vec<bool> &recStack, int count) {  
    if (recStack[i]) {  
      singleMaxCycleSize = std::max(singleMaxCycleSize, count);  
      if (count == 2)  
        paris.push_back({i, favorite[i]});  
      return;  
    }  
    if (visited[i])  
      return;  
  
    visited[i] = true;  
    recStack[i] = true;  
    auto &&children = graph[i];  
    for (int c : children)  
      isCyclicUtil(c, visited, recStack, count + 1);  
  
    recStack[i] = false;  
  }  
  
  void countCycle() {  
    vec<bool> visited(N), recStack(N);  
    for (int i = 0; i < N; i++)  
      isCyclicUtil(i, visited, recStack, 0);  
  }  
  
  int countSizeTwoExtra() {  
    vec<bool> visited(N);  
    int res = 0;  
  
    for (auto &&it : paris) {  
      int a = it[0], b = it[1];  
      max[a] = 0;  
      max[b] = 0;  
  
      visited[a] = true;  
      dfs(b, visited, 0, b);  
      visited[a] = false;  
  
      visited[b] = true;  
      dfs(a, visited, 0, a);  
      visited[b] = false;  
  
      res += 2 + max[a] + max[b];  
    }  
  
    return res;  
  }  
  
public:  
  int maximumInvitations(vec<int> favorite) {  
    this->favorite = std::move(favorite);  
    N = this->favorite.size();  
    for (int i = 0; i < N; i++) {  
      int from = this->favorite[i];  
      int to = i;  
      graph[from].push_back(to);  
    }  
  
    countCycle();  
    return std::max(singleMaxCycleSize, countSizeTwoExtra());  
  }  
};
```