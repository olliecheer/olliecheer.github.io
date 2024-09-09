---
tags:
  - graph
---
![[problems/pictures/Pasted image 20240910001010.png]]
![[problems/pictures/Pasted image 20240910001020.png]]
![[problems/pictures/Pasted image 20240910001028.png]]

```c++
class Solution {  
  enum class Color {  
    NONE,  
    BLUE,  
    RED,  
  };  
  
public:  
  bool isBipartite(vec<vec<int>> &graph) {  
    int N = graph.size();  
    vec<Color> colors(N, Color::NONE);  
    for (int i = 0; i < N; i++) {  
      if (colors[i] != Color::NONE)  
        continue;  
  
      std::queue<int> q;  
      q.push(i);  
      colors[i] = Color::BLUE;  
  
      while (!q.empty()) {  
        int cur = q.front();  
        for (int next : graph[cur]) {  
          if (colors[next] == Color::NONE) {  
            colors[next] =  
                (colors[cur] == Color::BLUE) ? Color::RED : Color::BLUE;  
            q.push(next);  
          } else if (colors[next] == colors[cur])  
            return false;  
        }  
      }  
    }  
  
    return true;  
  }  
};
```