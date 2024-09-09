---
tags:
---
![[problems/pictures/Pasted image 20240910021308.png]]
![[problems/pictures/Pasted image 20240910021320.png]]


```c++
class Solution {  
public:  
  int countCollisions(std::string &directions) {  
    int collisions = 0;  
    std::stack<char> stk;  
    stk.push(directions[0]);  
    for (int i = 1; i < directions.size(); i++) {  
      char cur = directions[i];  
      if ((stk.top() == 'R' && cur == 'L')) {  
        collisions += 2;  
        stk.pop();  
        cur = 'S';  
      } else if (stk.top() == 'S' && cur == 'L') {  
        cur = 'S';  
        collisions++;  
      }  
  
      while (!stk.empty() && ((stk.top() == 'R' && cur == 'S'))) {  
        collisions++;  
        stk.pop();  
      }  
  
      stk.push(cur);  
    }  
  
    return collisions;  
  }  
};
```


```c++
class Solution_2 {  
public:  
  int countCollisions(std::string &directions) {  
    int i = 0;  
    int j = directions.size() - 1;  
    int count = 0;  
    while (i < directions.size() && directions[i] == 'L')  
      i++;  
  
    while (i >= 0 && directions[j] == 'R')  
      j--;  
  
    for (int k = i; k <= j; i++) {  
      if (directions[k] != 'S')  
        count++;  
    }  
  
    return count;  
  }  
};
```