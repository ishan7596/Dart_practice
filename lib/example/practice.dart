void main() {
  List<List<int>> board = [
    [3, 0, 6, 5, 0, 8, 4, 0, 0],
    [5, 2, 0, 0, 0, 0, 0, 0, 0],
    [0, 8, 7, 0, 0, 0, 0, 3, 1],
    [0, 0, 3, 0, 1, 0, 0, 8, 0],
    [9, 0, 0, 8, 6, 3, 0, 0, 5],
    [0, 5, 0, 0, 9, 0, 6, 0, 0],
    [1, 3, 0, 0, 0, 0, 2, 5, 0],
    [0, 0, 0, 0, 0, 0, 0, 7, 4],
    [0, 0, 5, 2, 0, 6, 3, 0, 0]
  ];

  solveSudoku(board);

  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      print(board[i][j]);
    }
    print("\n");
  }
}

bool solveSudoku(List<List<int>> board) {
  for (int row = 0; row < 9; row++) {
    for (int col = 0; col < 9; col++) {
      if (board[row][col] == 0) {
        for (int num = 1; num <= 9; num++) {
          if (isValid(board, row, col, num)) {
            board[row][col] = num;
            if (solveSudoku(board)) {
              return true;
            } else {
              board[row][col] = 0;
            }
          }
        }
        return false;
      }
    }
  }
  return true;
}

bool isValid(List<List<int>> board, int row, int col, int num) {
  for (int i = 0; i < 9; i++) {
    if (board[row][i] == num || board[i][col] == num) {
      return false;
    }
  }

  int startRow = (row ~/ 3) * 3;
  int startCol = (col ~/ 3) * 3;
  for (int i = startRow; i < startRow + 3; i++) {
    for (int j = startCol; j < startCol + 3; j++) {
      if (board[i][j] == num) {
        return false;
      }
    }
  }
  return true;
}
