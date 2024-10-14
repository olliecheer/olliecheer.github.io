---
tags:
  - subarray
  - sum
  - prefix_sum
---
![[problems/pictures/Pasted image 20241010221543.png]]

### Prefix Sum

```c++
// T(n) = O(N^2)
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int subarraySum(vec<int> &nums, int k) {
    int N = nums.size();
    int count = 0;
    vec<int> prefix_sum(N + 1);
    for (int i = 1; i <= N; i++)
      prefix_sum[i] = prefix_sum[i - 1] + nums[i - 1];

    for (int start = 0; start < N; start++)
      for (int end = start + 1; end <= N; end++)
        if (prefix_sum[end] - prefix_sum[start] == k)
          count++;

    return count;
  }
};
```

### Prefix Sum + Hash Map

```c++
// O(n)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int subarraySum(vec<int> &nums, int k) {
    int sum = 0, res = 0;
    std::unordered_map<int, int> mp;
    mp[0] = 1;
    for (int n : nums) {
      sum += n;
      if (mp.count(sum - k))
        res += mp[sum - k];

      mp[sum]++;
    }

    return res;
  }
};
```
