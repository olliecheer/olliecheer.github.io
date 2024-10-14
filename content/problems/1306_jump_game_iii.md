---
tags:
  - jump_game
---
![[problems/pictures/Pasted image 20241013222901.png]]
![[problems/pictures/Pasted image 20241013222910.png]]


### Recursion

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool canReach(vec<int> &arr, int start) {
    if (start < 0 || start >= arr.size() || arr[start] < 0)
      return false;

    if (arr[start] == 0)
      return true;

    arr[start] *= -1;
    return canReach(arr, start + arr[start]) ||
           canReach(arr, start - arr[start]);
  }
};
```

### Iteration

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  bool canReach(vec<int> &arr, int start) {
    int N = arr.size();
    std::queue<int> q;
    q.push(start);

    while (!q.empty()) {
      int node = q.front();
      q.pop();
      if (arr[node] == 0)
        return true;

      if (arr[node] < 0)
        continue;

      if (node + arr[node] < N)
        q.push(node + arr[node]);

      if (node - arr[node] >= 0)
        q.push(node - arr[node]);

      arr[node] = -arr[node];
    }
    return false;
  }
};
```