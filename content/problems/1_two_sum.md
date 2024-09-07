---
tags:
  - array
  - sum
---
![[problems/pictures/Pasted image 20240907190934.png]]


```c++
class Solution {  
private:  
  struct Number {  
    int value;  
    int index;  
  };  
  
public:  
  vec<int> twoSum(vec<int> const &nums, int target) {  
    vec<Number> vec{};  
    int nr = nums.size();  
  
    for (int i = 0; i < nr; i++) {  
      vec.push_back({nums[i], i});  
    }  
  
    std::sort(vec.begin(), vec.end(),  
              [](Number const &left, Number const &right) {  
                return left.value < right.value;  
              });  
  
    for (int left = 0, right = vec.size() - 1; left != right;) {  
      if (vec[left].value + vec[right].value > target) {  
        right--;  
      } else if (vec[left].value + vec[right].value < target) {  
        left++;  
      } else {  
        return {vec[left].index, vec[right].index};  
      }  
    }  
  
    return {};  
  }  
};
```