---
tags:
  - top_k
---
![[problems/pictures/Pasted image 20241014004624.png]]


### Max Heap

```c++
// O(nlogn)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> topKFrequent(vec<int> &nums, int k) {
    using Frequency = int;
    std::map<int, Frequency> mp;
    for (int num : nums)
      mp[num]++;

    auto pq_comp = [&mp](int a, int b) { return mp[a] < mp[b]; };

    std::priority_queue<int, vec<int>, decltype(pq_comp)> pq(pq_comp);

    for (auto &it : mp)
      pq.push(it.first);

    vec<int> res;
    for (int i = 0; i < k; i++) {
      res.push_back(pq.top());
      pq.pop();
    }

    return res;
  }
};
```

### Min Heap
```c++
// O(nlogk)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> topKFrequent(vec<int> &nums, int k) {
    using Frequency = int;
    std::map<int, Frequency> mp;
    for (int num : nums)
      mp[num]++;

    auto pq_comp = [&mp](int a, int b) { return mp[a] > mp[b]; };

    std::priority_queue<int, vec<int>, decltype(pq_comp)> pq(pq_comp);
    for (auto &it : mp) {
      pq.push(it.first);
      if (pq.size() > k)
        pq.pop();
    }

    vec<int> res;
    while (!pq.empty()) {
      res.push_back(pq.top());
      pq.pop();
    }

    return res;
  }
};
```


### Quick Select

```c++
// avg O(n)  
// worst case O(n^2)  
// can random pivot, shuffle array to avoid worst case  
template <typename T> using vec = std::vector<T>;

class Solution {
  using Frequency = int;
  std::map<int, Frequency> value2freq;
  vec<int> uniq;

  int partition(int left, int right) {
    int pivot = value2freq[uniq[right]];
    int wall = left;
    for (int i = left; i <= right; i++) {
      if (value2freq[uniq[i]] < pivot) {
        std::swap(uniq[wall], uniq[i]);
        wall++;
      }
    }

    std::swap(uniq[wall], uniq[right]);
    return wall;
  }

  void quick_select(int left, int right, int k_smallest) {
    if (left == right)
      return;

    int posi = partition(left, right);
    if (k_smallest == posi)
      return;
    else if (k_smallest < posi)
      quick_select(left, posi - 1, k_smallest);
    else
      quick_select(posi + 1, right, k_smallest);
  }

public:
  vec<int> topKFrequent(vec<int> &nums, int k) {
    for (int it : nums)
      value2freq[it]++;

    int N = value2freq.size();
    uniq = vec<int>(N);

    int i = 0;
    for (auto &&it : value2freq) {
      uniq[i] = it.first;
      i++;
    }
    quick_select(0, N - 1, N - k);

    return {uniq.begin() + N - k, uniq.begin() + N};
  }
};
```

### Bucket Sort

```c++
// O(n)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  vec<int> topKFrequent(vec<int> &nums, int k) {
    vec<vec<int>> bucket(nums.size() + 1);
    std::unordered_map<int, int> value2freq;
    for (int it : nums)
      value2freq[it]++;

    for (auto &&it : value2freq) {
      int value = it.first;
      int freq = it.second;
      bucket[freq].push_back(value);
    }

    vec<int> res;
    for (int i = bucket.size() - 1; i >= 0 && res.size() < k; i--) {
      while (!bucket[i].empty() && res.size() < k) {
        res.push_back(bucket[i].back());
        bucket[i].pop_back();
      }
    }

    return res;
  }
};
```