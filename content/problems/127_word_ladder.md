---
tags:
  - dynamic_programming
  - dual_bfs
---
![[problems/pictures/Pasted image 20240908030814.png]]

```c++
class Solution_Single_BFS {  
public:  
  int ladderLength(std::string beginWord, std::string endWord,  
                   vec<std::string> wordList) {  
    std::unordered_set<std::string> st(wordList.begin(), wordList.end());  
    std::queue<std::string> q;  
    q.push(beginWord);  
  
    int step = 1, N = beginWord.size();  
  
    while (!q.empty()) {  
      int sz = q.size();  
      for (int i = 0; i < sz; i++) {  
        auto cur = q.front();  
        q.pop();  
  
        if (cur == endWord) {  
          return step;  
        }  
  
        for (int j = 0; j < N; j++) {  
          for (char letter = 'a'; letter <= 'z'; letter++) {  
            auto nextWord = cur;  
            nextWord[j] = letter;  
            if (st.count(nextWord)) {  
              st.erase(nextWord);  
              q.push(nextWord);  
            }  
          }  
        }  
      }  
      step++;  
    }  
  
    return 0;  
  }  
};
```


```c++
class Solution_Dual_BFS {  
public:  
  int ladderLength(std::string beginWord, std::string endWord,  
                   vec<std::string> wordList) {  
    std::unordered_set<std::string> begin_st, end_st,  
        word_st(wordList.begin(), wordList.end()), visited;  
    if (word_st.count(endWord) == 0) {  
      return 0;  
    }  
  
    int step = 1, N = beginWord.size();  
    begin_st.insert(beginWord);  
    end_st.insert(endWord);  
  
    while (!beginWord.empty() && !endWord.empty()) {  
      std::unordered_set<std::string> next_st;  
      for (auto &word : begin_st) {  
        for (int i = 0; i < N; i++) {  
          for (char c = 'a'; c < 'z'; c++) {  
            auto nextWord = word;  
            nextWord[i] = c;  
            if (end_st.count(nextWord)) {  
              return step + 1;  
            }  
  
            if (visited.count(nextWord) == 0 && word_st.count(nextWord)) {  
              visited.insert(nextWord);  
              next_st.insert(nextWord);  
            }  
          }  
        }  
      }  
  
      if (end_st.size() < next_st.size()) {  
        begin_st = std::move(end_st);  
        end_st = std::move(next_st);  
      } else {  
        begin_st = std::move(next_st);  
      }  
      step++;  
    }  
    return 0;  
  }  
};
```