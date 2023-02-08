import 'dart:io';

void main() {
  List a = [
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", " ", " "]
  ];

  String currentPlayer = "X";

  print("[1,2,3] \n[4,5,6] \n[7,8,9]  ");

  while (true) {
    print("Enter value : ${currentPlayer}");
    var value = int.parse(stdin.readLineSync() as String);
    if (value == 1) {
      a[0][0] = currentPlayer;
    } else if (value == 2) {
      a[0][1] = currentPlayer;
    } else if (value == 3) {
      a[0][2] = currentPlayer;
    } else if (value == 4) {
      a[1][0] = currentPlayer;
    } else if (value == 5) {
      a[1][1] = currentPlayer;
    } else if (value == 6) {
      a[1][2] = currentPlayer;
    } else if (value == 7) {
      a[2][0] = currentPlayer;
    } else if (value == 8) {
      a[2][1] = currentPlayer;
    } else if (value == 9) {
      a[2][2] = currentPlayer;
    }

    for (var element in a) {
      print(element);
    }
    // for (var i = 0; i < 3; i++) {
    //   if (a[i][0] == a[i][1]&&
    //       a[i][1] == a[i][2] &&
    //       a[i][0] != '') {
    //     print('Player ${currentPlayer} wins!');

    //     return;
    //   }
    // }
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
  }
}