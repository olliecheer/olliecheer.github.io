---
tags:
  - jump_game
---

![[problems/pictures/Pasted image 20240910012018.png]]
![[problems/pictures/Pasted image 20240910012042.png]]
![[problems/pictures/Pasted image 20240910012052.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<std::optional<int>> memo;
  vec<int> arr;
  int N, D;

  int dfs(int cur) {
    if (memo[cur])
      return memo[cur].value();

    int res = 1;
    for (int i = cur + 1; i <= std::min(cur + D, N - 1) && arr[i] < arr[cur];
         i++)
      res = std::max(res, 1 + dfs(i));

    for (int i = cur - 1; i >= std::max(cur - D, 0) && arr[i] < arr[cur]; i--)
      res = std::max(res, 1 + dfs(i));

    memo[cur] = res;
    return res;
  }

public:
  int maxJumps(vec<int> _arr, int d) {
    arr = std::move(_arr);
    N = arr.size();
    D = d;
    memo = vec<std::optional<int>>(N);

    int res = 1;
    for (int i = 0; i < N; i++)
      res = std::max(res, dfs(i));

    return res;
  }
};
```