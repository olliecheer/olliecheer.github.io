---
tags:
  - majority_number
  - vote
---
![[pictures/Pasted image 20241013235159.png]]



## Vote

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int majorityElement(vec<int> &nums) {
    int candidate = 0;
    int vote = 0;
    for (auto it : nums) {
      if (vote == 0) {
        candidate = it;
        vote = 1;
      } else {
        if (candidate == it) {
          vote++;
        } else {
          vote--;
        }
      }
    }

    return candidate;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  int divide(vec<int> &nums, int left, int right) {
    if (left == right)
      return nums[left];
    int mid = left + (right - left) / 2;
    int left_res = divide(nums, left, mid);
    int right_res = divide(nums, mid + 1, right);

    if (left_res == right_res)
      return left_res;

    int left_count = conquer(nums, left_res, left, right);
    int right_count = conquer(nums, right_res, left, right);

    return left_count > right_count ? left_res : right_res;
  }

  int conquer(vec<int> &nums, int target, int left, int right) {
    int count = 0;
    for (int i = left; i <= right; i++) {
      if (nums[i] == target)
        count++;
    }

    return count;
  }

public:
  int majorityElement(vec<int> &nums) {
    return divide(nums, 0, nums.size() - 1);
  }
};
```