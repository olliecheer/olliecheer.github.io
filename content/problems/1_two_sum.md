---
tags:
  - array
  - sum
  - sort
  - dual_pointer
---
![[problems/pictures/Pasted image 20241012194116.png]]
![[problems/pictures/Pasted image 20241012194126.png]]

```c++
template <typename T> using vec = std::vector<T>;

class Solution {
private:
    struct Number {
        int value;
        int index;
    };

public:
    vec<int> twoSum(vec<int> const& nums, int target) {
        vec<Number> vec{};
        int nr = nums.size();

        for (int i = 0; i < nr; i++) {
            vec.push_back({nums[i], i});
        }

        std::sort(vec.begin(), vec.end(),
                  [](Number const& left, Number const& right) {
                      return left.value < right.value;
                  });

        for (int left = 0, right = vec.size() - 1; left != right;) {
            auto&& left_it = vec[left];
            auto&& right_it = vec[right];
            if (left_it.value + right_it.value > target)
                right--;
            else if (left_it.value + right_it.value < target)
                left++;
            else
                return {left_it.index, right_it.index};
        }

        return {};
    }
};
```