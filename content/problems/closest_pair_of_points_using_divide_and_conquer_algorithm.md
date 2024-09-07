
```c++
class Solution {  
  struct Points {  
    int x;  
    int y;  
  };  
  
  long distance(Points &a, Points &b) {  
    return (b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y);  
  }  
  
  long divide(vec<Points> &points, int left, int right) {  
    long cur_min_dis = std::numeric_limits<long>::max();  
    if (left == right)  
      return cur_min_dis;  
  
    if (left + 1 == right)  
      return distance(points[left], points[right]);  
  
    int mid = left + (right - left) / 2;  
    int left_min_dis = divide(points, left, mid);  
    int right_min_dis = divide(points, mid, right);  
  
    cur_min_dis = std::min(left_min_dis, right_min_dis);  
  
    vec<int> valid_point_index;  
    for (int i = left; i <= right; i++) {  
      if (std::pow(std::abs(points[mid].x - points[i].x), 2) <= cur_min_dis)  
        valid_point_index.push_back(i);  
    }  
  
    std::sort(valid_point_index.begin(), valid_point_index.end(),  
              [&points](int a, int b) { return points[a].y < points[b].y; });  
  
    for (int i = 0; i < valid_point_index.size() - 1; i++) {  
      for (int j = i + 1; j < valid_point_index.size(); j++) {  
        if (std::pow(std::abs(points[valid_point_index[i]].y -  
                              points[valid_point_index[j]].y),  
                     2) > cur_min_dis)  
          continue;  
  
        long tmp_dis = distance(points[valid_point_index[i]],  
                                points[valid_point_index[j]]);  
        cur_min_dis = std::min(cur_min_dis, tmp_dis);  
      }  
    }  
  
    return cur_min_dis;  
  }  
  
public:  
  long findClosedPair(int n, vec<int> &xs, vec<int> &ys) {  
    int N = xs.size();  
    vec<Points> points;  
    for (int i = 0; i < N; i++)  
      points.push_back({xs[i], ys[i]});  
  
    std::sort(points.begin(), points.end(),  
              [](Points &a, Points &b) { return a.x < b.x; });  
  
    return divide(points, 0, N - 1);  
  }  
};
```