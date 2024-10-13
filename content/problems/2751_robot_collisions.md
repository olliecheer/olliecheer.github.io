---
tags:
    - mono_stack
---

![[pictures/Pasted image 20241013230807.png]]
![[pictures/Pasted image 20241013230820.png]]
![[pictures/Pasted image 20241013230833.png]]



### Mono Stack

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> survivedRobotsHealths(vec<int> &position, vec<int> health,
                                 std::string &direction) {
    int N = position.size();
    vec<int> ind;
    for (int i = 0; i < N; i++)
      ind.push_back(i);

    std::sort(ind.begin(), ind.end(),
              [&position](int a, int b) { return position[a] < position[b]; });

    std::stack<int> stk;
    for (int i : ind) {
      if (direction[i] == 'R') {
        stk.push(i);
        continue;
      }

      while (!stk.empty()) {
        int top = stk.top();
        if (health[top] > health[i]) {
          health[top]--;
          health[i] = 0;
          break;
        }

        if (health[top] == health[i]) {
          health[top] = 0;
          stk.pop();
          health[i] = 0;
          break;
        }

        health[top] = 0;
        stk.pop();
        health[i]--;
      }
    }

    vec<int> res;
    for (int v : health) {
      if (v > 0)
        res.push_back(v);
    }

    return res;
  }
};
```
