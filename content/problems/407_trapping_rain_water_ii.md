---
tags:
  - trap_water
---
![[problems/pictures/Pasted image 20240909221222.png]]
![[problems/pictures/Pasted image 20240909221235.png]]


```c++
// O(MNlog(MN))  
class Solution_dijkstra_pq {  
  vec<vec<int>> dirs = {  
      {0, 1},  
      {0, -1},  
      {1, 0},  
      {-1, 0},  
  };  
  
public:  
  int trapRainWater(vec<vec<int>> &heightMap) {  
    if (heightMap.size() <= 2 || heightMap[0].size() <= 2)  
      return 0;  
  
    int m = heightMap.size();  
    int n = heightMap[0].size();  
  
    auto pq_comp = [](vec<int> const &a, vec<int> const &b) {  
      return a[2] > b[2];  
    };  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)>  
        pq_water_height(pq_comp);  
    vec<vec<bool>> visited(m, vec<bool>(n, false));  
  
    for (int i = 0; i < m; i++) {  
      for (int j = 0; j < n; j++) {  
        if (i == 0 || i == m - 1 || j == 0 || j == n - 1) {  
          pq_water_height.push({i, j, heightMap[i][j]});  
          visited[i][j] = true;  
        }  
      }  
    }  
  
    int res = 0;  
  
    while (!pq_water_height.empty()) {  
      auto cur = pq_water_height.top();  
      pq_water_height.pop();  
  
      int x = cur[0], y = cur[1], h = cur[2];  
      for (auto &&dir : dirs) {  
        int nx = x + dir[0], ny = y + dir[1];  
        if (nx < 0 || nx >= m || ny < 0 || ny >= n)  
          continue;  
        if (visited[nx][ny])  
          continue;  
  
        if (h > heightMap[nx][ny])  
          res += h - heightMap[nx][ny];  
  
        pq_water_height.push({nx, ny, std::max(heightMap[nx][ny], h)});  
        visited[nx][ny] = true;  
      }  
    }  
  
    return res;  
  }  
};
```


```c++
// O(M^2 * N^2)  
class Solution_BFS {  
  vec<vec<int>> dirs = {  
      {0, 1},  
      {0, -1},  
      {1, 0},  
      {-1, 0},  
  };  
  
public:  
  int trapRainWater(vec<vec<int>> &heightMap) {  
    if (heightMap.size() <= 2 || heightMap[0].size() <= 2)  
      return 0;  
  
    int m = heightMap.size();  
    int n = heightMap[0].size();  
  
    int max_height = 0;  
    for (auto &&it : heightMap)  
      max_height =  
          std::max(max_height, *std::max_element(it.begin(), it.end()));  
  
    vec<vec<int>> water(m, vec<int>(n, max_height));  
    std::queue<vec<int>> q;  
  
    for (int i = 0; i < m; i++) {  
      for (int j = 0; j < n; j++) {  
        if (i == 0 || i == m - 1 || j == 0 || j == n - 1) {  
          if (water[i][j] > heightMap[i][j]) {  
            water[i][j] = heightMap[i][j];  
            q.push({i, j});  
          }  
        }  
      }  
    }  
  
    while (!q.empty()) {  
      auto cur = q.front();  
      q.pop();  
      int x = cur[0], y = cur[1];  
      for (auto &&dir : dirs) {  
        int nx = x + dir[0], ny = y + dir[1];  
        if (nx < 0 || nx >= m || ny < 0 || ny >= n)  
          continue;  
  
        if (water[x][y] < water[nx][ny] && water[nx][ny] > heightMap[nx][ny]) {  
          water[nx][ny] = std::max(water[x][y], heightMap[nx][ny]);  
          q.push({nx, ny});  
        }  
      }  
    }  
  
    int res = 0;  
    for (int i = 0; i < m; i++)  
      for (int j = 0; j < n; j++)  
        res += water[i][j] - heightMap[i][j];  
  
    return res;  
  }  
};
```