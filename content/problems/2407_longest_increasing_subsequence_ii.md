---
tags:
  - subsequence
  - segment_tree
---
![[pictures/Pasted image 20241013230235.png]]
![[pictures/Pasted image 20241013230247.png]]



```c++
class Solution {
    vector<int> max;

    void modify(int o, int l, int r, int i, int val) {
        if (l == r) {
            max[o] = val;
            return;
        }
        int m = (l + r) / 2;
        if (i <= m) modify(o * 2, l, m, i, val);
        else modify(o * 2 + 1, m + 1, r, i, val);
        max[o] = std::max(max[o * 2], max[o * 2 + 1]);
    }

    // 返回区间 [L,R] 内的最大值
    int query(int o, int l, int r, int L, int R) { // L 和 R 在整个递归过程中均不变，将其大写，视作常量
        if (L <= l && r <= R) return max[o];
        int res = 0;
        int m = (l + r) / 2;
        if (L <= m) res = query(o * 2, l, m, L, R);
        if (R > m) res = std::max(res, query(o * 2 + 1, m + 1, r, L, R));
        return res;
    }

public:
    int lengthOfLIS(vector<int> &nums, int k) {
        int u = *max_element(nums.begin(), nums.end());
        max.resize(u * 4);
        for (int x: nums) {
            if (x == 1) modify(1, 1, u, 1, 1);
            else {
                int res = 1 + query(1, 1, u, std::max(x - k, 1), x - 1);
                modify(1, 1, u, x, res);
            }
        }
        return max[1];
    }
};
```