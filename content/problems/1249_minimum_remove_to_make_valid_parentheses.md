---
tags:
  - parentheses
---
![[problems/pictures/Pasted image 20241013222515.png]]
![[problems/pictures/Pasted image 20241013222530.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  std::string minRemoveToMakeValid(std::string &s) {
    std::unordered_set<int> index2remove;
    std::stack<int> stk;

    for (int i = 0; i < s.size(); i++) {
      if (s[i] == '(')
        stk.push(i);
      else if (s[i] == ')') {
        if (stk.empty())
          index2remove.insert(i);
        else
          stk.pop();
      }
    }

    while (!stk.empty()) {
      index2remove.insert(stk.top());
      stk.pop();
    }

    std::string res;
    for (int i = 0; i < s.size(); i++)
      if (!index2remove.count(i))
        res.push_back(s[i]);

    return res;
  }
};
```


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
public:
  std::string minRemoveToMakeValid(std::string &s) {
    std::string tmp;
    int balance = 0;

    // pass 1
    for (char c : s) {
      if (c == '(')
        balance++;
      else if (c == ')') {
        if (balance == 0)
          continue;
        balance--;
      }
      tmp.push_back(c);
    }

    // pass 2
    std::string res;
    int N = tmp.size();

    balance = 0;
    for (int i = N - 1; i >= 0; i--) {
      char c = tmp[i];
      if (c == ')')
        balance++;
      else if (c == '(') {
        if (balance == 0)
          continue;

        balance--;
      }
      res.push_back(c);
    }

    std::reverse(res.begin(), res.end());
    return res;
  }
};
```