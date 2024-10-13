---
tags:
  - dual_bfs
---
![[pictures/Pasted image 20241013223422.png]]
![[pictures/Pasted image 20241013223433.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minJumps(vec<int> arr) {
    int N = arr.size();
    std::unordered_map<int, vec<int>> value2index;
    for (int i = 0; i < N; i++)
      value2index[arr[i]].push_back(i);

    std::unordered_set<int> visited;
    visited.insert(0);

    std::queue<int> q;
    q.push(0);

    int step = 0;

    while (!q.empty()) {
      int sz = q.size();
      for (int i = 0; i < sz; i++) {
        int cur = q.front();
        q.pop();
        if (cur == N - 1)
          return step;

        vec<int> neighbor = value2index[arr[cur]];
        neighbor.push_back(cur - 1);
        neighbor.push_back(cur + 1);
        for (int next : neighbor)
          if (next >= 0 && next < N && visited.count(next) == 0) {
            q.push(next);
            visited.insert(next);
          }

        value2index[arr[cur]].clear();
      }

      step++;
    }

    return 0;
  }
};
```


```c++
// bi-direction BFS  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int minJumps(vec<int> arr) {
    int N = arr.size();
    if (N <= 1)
      return 0;
    std::unordered_map<int, vec<int>> value2index;
    for (int i = 0; i < N; i++)
      value2index[arr[i]].push_back(i);

    std::unordered_set<int> visited;
    visited.insert(0);
    visited.insert(N - 1);

    std::unordered_set<int> head, tail;
    head.insert(0);
    tail.insert(N - 1);

    int step = 0;

    while (!head.empty()) {
      if (head.size() > tail.size())
        std::swap(head, tail);

      std::unordered_set<int> next;
      for (int cur : head) {
        for (int z : value2index[arr[cur]]) {
          if (tail.count(z))
            return step + 1;

          if (!visited.count(z)) {
            next.insert(z);
            visited.insert(z);
          }
        }

        value2index[arr[cur]].clear();

        if (tail.count(cur + 1) || tail.count(cur - 1))
          return step + 1;

        int x = cur + 1, y = cur - 1;
        if (x < N && !visited.count(x)) {
          next.insert(x);
          visited.insert(x);
        }

        if (y >= 0 && !visited.count(y)) {
          next.insert(y);
          visited.insert(y);
        }
      }

      step++;
      head = next;
    }

    return -1;
  }
};
```