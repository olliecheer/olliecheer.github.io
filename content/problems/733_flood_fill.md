---
tags:
  - dfs
---
![[problems/pictures/Pasted image 20240909233242.png]]

```c++
class Solution {  
  void dfs(vec<vec<int>> &image, int sr, int sc, int oldColor, int newColor) {  
    if (sr < 0 || sc < 0 || sr >= image.size() || sc >= image[0].size() ||  
        image[sr][sc] != oldColor) {  
      return;  
    }  
  
    image[sr][sc] = newColor;  
  
    dfs(image, sr + 1, sc, oldColor, newColor);  
    dfs(image, sr - 1, sc, oldColor, newColor);  
    dfs(image, sr, sc + 1, oldColor, newColor);  
    dfs(image, sr, sc - 1, oldColor, newColor);  
  }  
  
public:  
  vec<vec<int>> floodFill(vec<vec<int>> image, int sr, int sc, int newColor) {  
    int oldColor = image[sr][sc];  
    if (oldColor != newColor) {  
      dfs(image, sr, sc, oldColor, newColor);  
    }  
  
    return image;  
  }  
};
```