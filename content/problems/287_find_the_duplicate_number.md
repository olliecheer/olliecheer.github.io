---
tags:
---
![[problems/pictures/Pasted image 20241014002827.png]]
![[problems/pictures/Pasted image 20241014002836.png]]



```c++
// Time O(N)  
// Space O(1)  
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  int findDuplicate(vec<int> &nums) {
    int slow = nums[0], fast = nums[0];
    while (true) {
      slow = nums[slow];
      fast = nums[nums[fast]];

      if (slow == fast) {
        fast = nums[0];
        while (fast != slow) {
          slow = nums[slow];
          fast = nums[fast];
        }

        return slow;
      }
    }
  }
};
```