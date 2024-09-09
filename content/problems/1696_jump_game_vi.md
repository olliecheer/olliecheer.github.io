---
tags:
  - jump_game
---
![[problems/pictures/Pasted image 20240910015805.png]]


```c++
class Solution_mono_queue {  
public:  
  int maxResult(vec<int> &nums, int k) {  
    int N = nums.size();  
    vec<int> dp(N);  
    dp[0] = nums[0];  
  
    std::deque<int> q;  
    q.push_back(0);  
  
    for (int i = 0; i < N - 1; i++) {  
      while (!q.empty() && i - q.front() >= k)  
        q.pop_front();  
  
      while (!q.empty() && dp[q.back()] <= dp[i])  
        q.pop_back();  
  
      q.push_back(i);  
      dp[i + 1] = dp[q.front()] + nums[i + 1];  
    }  
  
    return dp[N - 1];  
  }  
};
```


```c++
class Solution_priority_queue {  
public:  
  int maxResult(vec<int> &nums, int k) {  
    int N = nums.size();  
    vec<int> score(N);  
    score[0] = nums[0];  
  
    auto pq_comp = [](vec<int> &a, vec<int> &b) { return a[0] < b[0]; };  
    std::priority_queue<vec<int>, vec<vec<int>>, decltype(pq_comp)> pq(pq_comp);  
    pq.push({nums[0], 0});  
  
    for (int i = 1; i < N; i++) {  
      while (i - pq.top()[1] > k)  
        pq.pop();  
  
      score[i] = nums[i] + score[pq.top()[1]];  
      pq.push({score[i], i});  
    }  
  
    return score[N - 1];  
  }  
};
```