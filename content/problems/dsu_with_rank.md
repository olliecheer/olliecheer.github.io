
```c++
template <typename T> using vec = std::vector<T>;

class DSU {
  vec<int> parent;
  vec<int> rank;

public:
  explicit DSU(int N) : parent(N), rank(N, 1) {
    for (int i = 0; i < N; i++)
      parent[i] = i;
  }

  int find(int x) {
    if (parent[x] != x)
      parent[x] = find(parent[x]);

    return parent[x];
  }

  void union_(int x, int y) {
    int root_x = find(x), root_y = find(y);
    if (root_x == root_y)
      return;

    if (rank[root_x] < rank[root_y])
      parent[root_x] = root_y;
    else if (rank[root_x] > rank[root_y])
      parent[root_y] = root_x;
    else {
      parent[root_x] = root_y;
      rank[root_y]++;
    }
  }
};
```