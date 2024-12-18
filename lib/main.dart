import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  late List<String> board;
  late String currentPlayer;
  late bool gameOver;
  late String result;

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    board = List.generate(9, (index) => '');
    currentPlayer = 'X';
    gameOver = false;
    result = '';
  }

  void handleTap(int index) {
    if (board[index] == '' && !gameOver) {
      setState(() {
        board[index] = currentPlayer;
        if (checkWinner(currentPlayer)) {
          gameOver = true;
          result = '$currentPlayer Wins!';
        } else if (board.every((element) => element != '')) {
          gameOver = true;
          result = 'It\'s a Draw!';
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool checkWinner(String player) {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => handleTap(index),
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: TextStyle(fontSize: 64.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (gameOver)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                result,
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: resetGame,
              child: Text('Restart Game'),
            ),
          ),
        ],
      ),
    );
  }
}
