//This code is a solution for solving a sudoku puzzle using backtracking.
//
// The main function is defined, and a 2D array "a" is initialized with a sudoku puzzle.
// The for loop iterates through the 2D array "a" and prints each element (each row of the puzzle) so that user can see the initial puzzle.
// The sudoku function is called and passed the 2D array "a" as an argument.
// The sudoku function uses nested for loops to iterate through the rows and columns of the 2D array. If a given element (cell) is equal to 0, the function enters a for loop that iterates from 1 to 9. This is to check if the current cell is empty, if yes then it will try to fill the empty cell with possible number from 1-9
// The check function is called, passing the 2D array "a", the current row and column being checked, and the current number being considered as a possible value for that cell. the check function is used to check if the current number being considered is valid in the current cell or not.
// The check function uses nested for loops to check if the current number being considered is already present in the same row, column, or 3x3 sub-grid of the puzzle.
// If the check function returns true, the current cell's value is set to the current number being considered, and the sudoku function is recursively called again. The reason for recursion is that the function will try to fill the empty cell with possible number from 1-9 and check if it valid or not.
// If the sudoku function returns true, the program exits the current recursive call and the solved puzzle is printed.
// If the sudoku function returns false, the current cell's value is set back to 0 and the program continues iterating through the possible numbers for that cell.
// If no solution is found, the program returns false and "No solution found" is printed.
// This code uses backtracking to solve the sudoku puzzle, it tries to fill the empty cells with possible numbers, if the number is valid it continues to next empty cell, if the number is not valid it backtracks and try another number. This process continues until all the empty cells are filled and the puzzle is solved.

void main() {
  var a = [
    [3, 0, 0, 8, 0, 1, 0, 0, 2],
    [2, 0, 1, 0, 3, 0, 6, 0, 4],
    [0, 0, 0, 2, 0, 4, 0, 0, 0],
    [8, 0, 9, 0, 0, 0, 1, 0, 6],
    [0, 6, 0, 0, 0, 0, 0, 5, 0],
    [7, 0, 2, 0, 0, 0, 4, 0, 9],
    [0, 0, 0, 5, 0, 9, 0, 0, 0],
    [9, 0, 4, 0, 8, 0, 7, 0, 5],
    [6, 0, 0, 1, 0, 7, 0, 0, 3]];

  for(var i in a) {
    print(i);
  };

  if (sudoku(a) == true) {
    var b = [];
    print("\nSolved board: \n");
    b= b+ a;
    for(var list in b){
      print(list);
    }
  } else {
    print("No solution found.");
  }
}

bool sudoku(var a) {
  for (var row = 0; row < 9; row++) {
    for (var col = 0; col < 9; col++) {
      if (a[row][col] == 0)
      {
        for (var num = 1; num <= 9; num++) {
          if (check(a, row, col, num) == true) {
            a[row][col] = num;

            if (sudoku(a) == true ) {
              return true;
            } else {
              a[row][col] = 0;
            }
          }
        }

        return false;
      }
    }
  }
  return true;
}


bool check(var a, int row, int col, int num) {


  for (var i = 0; i < 9; i++) {
    if (a[row][i] == num) {
      return false;
    }
  }

  for (var i = 0; i < 9; i++) {
    if (a[i][col] == num) {
      return false;
    }
  }

  int startRow = row - row % 3;
  int startCol = col - col % 3;
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
      if (a[i + startRow][j + startCol] == num) {
        return false;
      }
    }
  }

  return true;
}

