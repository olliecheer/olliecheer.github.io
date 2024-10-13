---
tags:
  - priority_queue
  - stack
---
![[pictures/Pasted image 20241013201335.png]]
![[pictures/Pasted image 20241013201344.png]]



```c++
// Stack
// O(1)
template <typename T> using vec = std::vector<T>;

class FreqStack {
  std::unordered_map<int, int> mp;
  std::unordered_map<int, std::stack<int>> freq2element;
  int max_freq{};

public:
  void push(int x) {
    mp[x]++;
    int cur_freq = mp[x];
    freq2element[cur_freq].push(x);
    max_freq = std::max(cur_freq, max_freq);
  }

  int pop() {
    int x = freq2element[max_freq].top();
    freq2element[max_freq].pop();
    if (freq2element[max_freq].empty())
      max_freq--;

    mp[x]--;
    return x;
  }
};
```