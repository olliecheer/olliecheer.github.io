---
tags:
  - queen
  - matrix
  - dfs
---
![[pictures/Pasted image 20241012200257.png]]
![[pictures/Pasted image 20241012200310.png]]


```c++
template <typename T> using vec = std::vector<T>;

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
    vec<vec<char>> board(n, vec<char>(n, '.'));
    vec<vec<std::string>> res;
    dfs(board, 0, res);
    return res;
  }
};
```