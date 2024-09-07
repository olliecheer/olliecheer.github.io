---
tags:
  - dsu
---


![[problems/pictures/Pasted image 20240908030916.png]]

```c++
class Solution {  
  class DSU {  
    vec<int> parent, size;  
  
  public:  
    explicit DSU(int N) : parent(N), size(N, 1) {  
      for (int i = 0; i < N; i++)  
        parent[i] = i;  
    }  
  
    int find(int x) {  
      if (parent[x] != x)  
        parent[x] = find(parent[x]);  
  
      return parent[x];  
    }  
  
    void union_(int x, int y) {  
      int X = find(x), Y = find(y);  
      if (X == Y)  
        return;  
      if (size[X] <= size[Y]) {  
        parent[X] = Y;  
        size[Y] += size[X];  
      } else {  
        parent[Y] = X;  
        size[X] += size[Y];  
      }  
    }  
  
    int findMax() {  
      int res = 0;  
      for (int s : size)  
        res = std::max(res, s);  
  
      return res;  
    }  
  };  
  
public:  
  int longestConsecutive(vec<int> &nums) {  
    DSU dsu(nums.size());  
    std::unordered_map<int, int> mp;  
  
    for (int i = 0; i < nums.size(); i++) {  
      if (mp.count(nums[i]))  
        continue;  
  
      mp[nums[i]] = i;  
  
      if (mp.count(nums[i] + 1))  
        dsu.union_(i, mp[nums[i] + 1]);  
  
      if (mp.count(nums[i] - 1))  
        dsu.union_(i, mp[nums[i] - 1]);  
    }  
  
    return dsu.findMax();  
  }  
};
```