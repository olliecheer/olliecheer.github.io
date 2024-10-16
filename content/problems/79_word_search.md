---
tags:
  - search
  - matrix
  - dfs
---
![[problems/pictures/Pasted image 20241012201345.png]]
![[problems/pictures/Pasted image 20241012201356.png]]
![[problems/pictures/Pasted image 20241012201413.png]]
![[problems/pictures/Pasted image 20241012201420.png]]



```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  vec<std::pair<int, int>> dirs = {
      {0, 1},
      {0, -1},
      {1, 0},
      {-1, 0},
  };

  bool findWord(vec<vec<char>> const &board, int i, int j, std::string word,
                int pos, vec<vec<bool>> &visisted) {
    if (pos == word.size())
      return true;

    visisted[i][j] = true;
    for (auto dir : dirs) {
      int x = i + dir.first, y = j + dir.second;
      if (x >= 0 && x < board.size() && y >= 0 && y < board[0].size() &&
          !visisted[x][y] && board[x][y] == word[pos])
        if (findWord(board, x, y, word, pos + 1, visisted))
          return true;
    }
    visisted[i][j] = false;
    return false;
  }

public:
  bool exist(vec<vec<char>> board, std::string word) {
    int M = board.size(), N = board[0].size();
    vec<vec<bool>> visisted(M, vec<bool>(N));
    for (int i = 0; i < M; i++)
      for (int j = 0; j < N; j++)
        if (board[i][j] == word[0] && findWord(board, i, j, word, 1, visisted))
          return true;

    return false;
  }
};
```