---
tags:
  - array
  - majority_number
---
![[pictures/Pasted image 20241012200148.png]]
![[pictures/Pasted image 20241012200158.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int majorityNumber(vec<int> &nums, int k) {
    std::unordered_map<int, int> mp;
    for (int i : nums) {
      if (mp.count(i))
        mp[i]++;
      else if (mp.size() < k - 1)
        mp[i] = 1;
      else {
        vec<int> to_erase;

        for (auto &&it : mp) {
          int key = it.first;
          int val = it.second;

          if (val == 1)
            to_erase.push_back(key);
          else
            mp[key]--;
        }

        for (int j : to_erase)
          mp.erase(j);
      }
    }

    for (auto &&it : mp)
      it.second = 0;

    for (int i : nums) {
      if (mp.count(i)) {
        if (mp[i] + 1 > (nums.size() / k))
          return i;

        mp[i]++;
      }
    }

    return 0;
  }
};
```