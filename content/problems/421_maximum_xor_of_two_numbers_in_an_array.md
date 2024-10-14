---
tags:
---
![[problems/pictures/Pasted image 20241014005804.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  class TrieNode {
    vec<TrieNode *> children;

  public:
    TrieNode() : children(2) {}

    ~TrieNode() {
      for (auto it : children)
        delete it;
    }

    void addNum(TrieNode *root, int num) {
      auto cur = root;
      for (int i = 31; i >= 0; i--) {
        int cur_bit = (num >> i) & 1;
        if (!cur->children[cur_bit])
          cur->children[cur_bit] = new TrieNode{};

        cur = cur->children[cur_bit];
      }
    }

    int findMaxXor(TrieNode *root, int num) {
      int sum = 0;
      auto cur = root;
      for (int i = 31; i >= 0; i--) {
        int cur_bit = (num >> i) & 1;
        int other_choice = (cur_bit == 1 ? 0 : 1);
        if (!cur->children[other_choice])
          cur = cur->children[cur_bit];
        else {
          sum += (1 << i);
          cur = cur->children[other_choice];
        }
      }

      return sum;
    }
  };

public:
  int findMaximumXOR(vec<int> &nums) {
    int res = INT_MIN;
    TrieNode root;
    for (int num : nums)
      root.addNum(&root, num);

    for (int num : nums)
      res = std::max(res, root.findMaxXor(&root, num));

    return res;
  }
};
```