---
tags:
  - jump_game
---
![[problems/pictures/Pasted image 20240910011643.png]]

```c++
class Solution_recursion {  
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


```c++
class Solution_iteration {  
public:  
  bool canReach(vec<int> &arr, int start) {  
    int N = arr.size();  
    std::queue<int> q;  
    q.push(start);  
  
    while (!q.empty()) {  
      int node = q.front();  
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