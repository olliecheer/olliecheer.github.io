---
tags:
---
![[problems/pictures/Pasted image 20240910021308.png]]
![[problems/pictures/Pasted image 20240910021320.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int countCollisions(std::string &directions) {
    int collisions = 0;
    std::stack<char> stk;
    stk.push(directions[0]);
    for (int i = 1; i < directions.size(); i++) {
      char cur = directions[i];
      if ((stk.top() == 'R' && cur == 'L')) {
        collisions += 2;
        stk.pop();
        cur = 'S';
      } else if (stk.top() == 'S' && cur == 'L') {
        cur = 'S';
        collisions++;
      }

      while (!stk.empty() && ((stk.top() == 'R' && cur == 'S'))) {
        collisions++;
        stk.pop();
      }

      stk.push(cur);
    }

    return collisions;
  }
};
```
