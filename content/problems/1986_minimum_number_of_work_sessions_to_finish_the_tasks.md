---
tags:
  - dfs
  - pruning
---
![[pictures/Pasted image 20241010084740.png]]
![[pictures/Pasted image 20241010084751.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int res, max_session_time;
  vec<int> tasks, sessions;

  void dfs(int task_id, int session_count) {
    if (session_count > res) // pruning
      return;
    if (task_id < 0) {
      res = std::min(res, session_count);
      return;
    }

    for (int i = 0; i < session_count; i++) {
      if (sessions[i] + tasks[task_id] <= max_session_time) {
        sessions[i] += tasks[task_id];
        dfs(task_id - 1, session_count);
        sessions[i] -= tasks[task_id];
      }
    }

    sessions[session_count] += tasks[task_id];
    dfs(task_id - 1, session_count + 1);
    sessions[session_count] -= tasks[task_id];
  }

public:
  int minSessions(vec<int> _tasks, int sessionTime) {
    tasks = std::move(_tasks);
    std::sort(tasks.begin(), tasks.end()); // pruning
    res = tasks.size();
    max_session_time = sessionTime;
    sessions = vec<int>(tasks.size());
    dfs(tasks.size() - 1, 0);
    return res;
  }
};
```