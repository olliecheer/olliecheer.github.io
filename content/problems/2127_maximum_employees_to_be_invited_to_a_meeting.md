---
tags:
  - dfs
---
![[pictures/Pasted image 20241009213712.png]]
![[pictures/Pasted image 20241009213724.png]]
![[pictures/Pasted image 20241009213740.png]]
![[pictures/Pasted image 20241009213759.png]]
![[pictures/Pasted image 20241009213811.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int maximumInvitations(vec<int> &favorite) {
    int n = favorite.size();
    // 统计入度，便于进行拓扑排序
    vec<int> indeg(n);
    for (int i = 0; i < n; ++i)
      indeg[favorite[i]]++;

    vec<int> visited(n), dp(n, 1);
    std::queue<int> q;
    for (int i = 0; i < n; ++i)
      if (!indeg[i])
        q.push(i);

    while (!q.empty()) {
      int from = q.front();
      q.pop();
      visited[u] = true;
      int to = favorite[from];
      // 状态转移
      dp[to] = std::max(dp[to], dp[from] + 1);
      indeg[to]--;
      if (!indeg[to])
        q.push(to);
    }
    // ring 表示最大的环的大小
    // total 表示所有环大小为 2 的「基环内向树」上的最长的「双向游走」路径之和
    int ring = 0, total = 0;
    for (int i = 0; i < n; ++i) {
      if (!visited[i]) {
        int j = favorite[i];
        // favorite[favorite[i]] = i 说明环的大小为 2
        if (favorite[j] == i) {
          total += dp[i] + dp[j];
          visited[i] = visited[j] = true;
        }
        // 否则环的大小至少为 3，我们需要找出环
        else {
          int u = i, cnt = 0;
          while (true) {
            ++cnt;
            u = favorite[u];
            visited[u] = true;
            if (u == i)
              break;
          }
          ring = std::max(ring, cnt);
        }
      }
    }
    return std::max(ring, total);
  }
};

```