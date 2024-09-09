---
tags:
  - priority_queue
  - stack
---
![[problems/pictures/Pasted image 20240910002141.png]]
![[problems/pictures/Pasted image 20240910002148.png]]


```c++
//  priority queue  
// O(logN)  
class FreqStack {  
  int push_count{};  
  
  std::priority_queue<vec<int>, vec<vec<int>>, std::greater<>> pq{  
      std::greater<>{}};  
  std::unordered_map<int, int> mp;  
  
public:  
  void push(int x) {  
    mp[x]++;  
    pq.push({x, mp[x], push_count});  
    push_count++;  
  }  
  
  int pop() {  
    int most_freq_element = pq.top()[0];  
    pq.pop();  
    mp[most_freq_element]--;  
    return most_freq_element;  
  }  
};
```


```c++
// Stack  
// O(1)  
class FreqStack_2 {  
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