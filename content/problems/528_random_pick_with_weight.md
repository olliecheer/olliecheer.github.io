---
tags:
  - random
---
![[problems/pictures/Pasted image 20240909225029.png]]
![[problems/pictures/Pasted image 20240909225045.png]]


```c++
class Solution_tree_map {  
  std::map<int, int> mp;  
  int weight;  
  
public:  
  explicit Solution_tree_map(vec<int> &w) {  
    for (int i = 0; i < w.size(); i++) {  
      weight += w[i];  
      mp[weight] = i;  
    }  
  }  
  
  int pickIndex() {  
    int n = rand() % weight;  
    auto it = mp.upper_bound(n);  
    return it->second;  
  }  
};
```


```c++
class Solution_prefix_sum {  
  vec<int> prefix_sum;  
  int total;  
  
public:  
  explicit Solution_prefix_sum(vec<int> &w) : prefix_sum(w.size()) {  
    for (int i = 0; i < w.size(); i++) {  
      total += w[i];  
      prefix_sum[i] = total;  
    }  
  }  
  
  int pickIndex() {  
    double target = total * rand();  
    int left = 0, right = prefix_sum.size();  
    while (left <= right) {  
      int mid = left + (right - left) / 2;  
      if (prefix_sum[mid] < target)  
        left = mid + 1;  
      else  
        right = mid - 1;  
    }  
  
    return left;  
  }  
};
```