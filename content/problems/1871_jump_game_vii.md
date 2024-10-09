---
tags:
  - jump_game
---
![[problems/pictures/Pasted image 20240910020734.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int next_zero_index(std::string &s, int current) {
    for (int i = current + 1; i < s.size(); i++)
      if (s[i] == '0')
        return i;

    return -1;
  }

  bool canReach(std::string &s, int minJump, int maxJump) {
    int N = s.size();
    std::queue<int> q;
    q.push(0);
    for (int i = 0; i < N && i != -1; i = next_zero_index(s, i)) {
      while (!q.empty() && q.front() < i - maxJump)
        q.pop();

      if (!q.empty() && i - q.front() >= minJump) {
        q.push(i);
        if (i == N - 1)
          return true;
      }

      if (q.empty())
        return false;
    }

    return false;
  }
};
```