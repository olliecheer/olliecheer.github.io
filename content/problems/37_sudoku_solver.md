---
tags:
  - sudoku
  - matrix
---
![[problems/pictures/Pasted image 20241012195744.png]]
![[problems/pictures/Pasted image 20241012195755.png]]
![[problems/pictures/Pasted image 20241012195806.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  bool is_valid(vec<vec<char>> &board, int i, int j, char c) {
    for (int row = 0; row < 9; row++) {
      if (board[row][j] == c)
        return false;
    }

    for (int col = 0; col < 9; col++) {
      if (board[i][col] == c)
        return false;
    }

    for (int row = (i / 3) * 3; row < (i / 3) * 3 + 3; row++) {
      for (int col = (j / 3) * 3; col < (j / 3) * 3 + 3; col++) {
        if (board[row][col] == c)
          return false;
      }
    }

    return true;
  }

  bool do_solve(vec<vec<char>> &board) {
    for (int i = 0; i < board.size(); i++)
      for (int j = 0; j < board[0].size(); j++)
        if (board[i][j] == '.') {
          for (char c = '1'; c <= '9'; c++)
            if (is_valid(board, i, j, c)) {
              board[i][j] = c;
              if (do_solve(board))
                return true;
              else
                board[i][j] = '.';
            }

          return false;
        }

    return true;
  }

public:
  void solveSudoku(vec<vec<char>> &board) { do_solve(board); }
};
```