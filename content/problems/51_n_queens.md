---
tags:
  - queen
  - matrix
  - dfs
---
![[problems/pictures/Pasted image 20240907232913.png]]

```c++
class Solution {  
  vec<std::string> construct(vec<vec<char>> &board) {  
    vec<std::string> res;  
    for (auto &it : board)  
      res.emplace_back(it.begin(), it.end());  
  
    return res;  
  }  
  
  bool validate(vec<vec<char>> &board, int x, int y) {  
    for (int i = 0; i < board.size(); i++) {  
      for (int j = 0; j < y; j++) {  
        if (board[i][j] == 'Q' && (x + j == y + i || x + y == i + j || x == i))  
          return false;  
      }  
    }  
  
    return true;  
  }  
  
  void dfs(vec<vec<char>> &board, int col, vec<vec<std::string>> &res) {  
    if (col == board.size()) {  
      res.push_back(construct(board));  
      return;  
    }  
  
    for (int i = 0; i < board.size(); i++) {  
      if (validate(board, i, col)) {  
        board[i][col] = 'Q';  
        dfs(board, col + 1, res);  
        board[i][col] = '.';  
      }  
    }  
  }  
  
public:  
  vec<vec<std::string>> solveNQueens(int n) {  
    vec<vec<char>> board(n, vec<char>(n));  
    for (int i = 0; i < n; i++) {  
      for (int j = 0; j < n; j++) {  
        board[i][j] = '.';  
      }  
    }  
  
    vec<vec<std::string>> res;  
    dfs(board, 0, res);  
    return res;  
  }  
};
```