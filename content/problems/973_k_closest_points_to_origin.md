---
tags:
  - priority_queue
---
![[problems/pictures/Pasted image 20241013202032.png]]
![[problems/pictures/Pasted image 20241013202043.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<vec<int>> kClosest(vec<vec<int>> const &points, int K) {
    int N = points.size();
    vec<std::pair<int, int>> dists(N);

    auto compute_square_sum = [](vec<int> const &p) {
      return p[0] * p[0] + p[1] * p[1];
    };

    for (int i = 0; i < N; i++) {
      dists[i].first = compute_square_sum(points[i]);
      dists[i].second = i;
    }

    std::sort(dists.begin(), dists.end());

    int distK = dists[K - 1].first;
    vec<vec<int>> res;

    for (auto const &it : dists)
      if (it.first <= distK)
        res.push_back(points[it.second]);
      else
        break;

    return res;
  }
};
```

```c++
class Solution_priority_queue {  
public:  
  vec<vec<int>> kClosest(vec<vec<int>> &points, int K) {  
    auto compute_square_sum = [](vec<int> &p) {  
      return p[0] * p[0] + p[1] * p[1];  
    };  
    for (auto &it : points)  
      it.push_back(compute_square_sum(it));  
  
    auto comp = [compute_square_sum](vec<int> &a, vec<int> &b) {  
      return a[2] < b[2];  
    };  
  
    std::make_heap(points.begin(), points.end(), comp);  
    vec<vec<int>> res;  
  
    for (int i = 0; i < K; i++) {  
      std::pop_heap(points.begin(), points.end(), comp);  
      res.push_back({points[i][0], points[i][1]});  
      points.pop_back();  
    }  
  
    return res;  
  }  
};
```

```c++
class Solution_quick_select {  
  static int partition(vec<vec<int>> &points, int left, int right) {  
    auto compute_square_sum = [](vec<int> const &p) {  
      return p[0] * p[0] + p[1] + p[1];  
    };  
    auto pivot = points[right];  
    int wall = left;  
    for (int i = left; i < right; i++) {  
      if (compute_square_sum(points[i]) <= compute_square_sum(pivot)) {  
        std::swap(points[i], points[wall]);  
        wall++;  
      }  
    }  
  
    std::swap(points[wall], points[right]);  
    return wall;  
  }  
  
public:  
  vec<vec<int>> kClosest(vec<vec<int>> &points, int K) {  
    int N = points.size();  
    int left = 0, right = N - 1;  
    while (left <= right) {  
      int mid = partition(points, left, right);  
  
      if (mid < K)  
        left = mid + 1;  
      else if (mid > K)  
        right = mid - 1;  
      else  
        break;  
    }  
  
    //        vec<vec<int>> res(points.begin(), points.begin() + K);  
    //        return res;    return {points.begin(), points.begin() + K};  
  }  
};
```