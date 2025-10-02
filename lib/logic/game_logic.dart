import '../models/game_state.dart';

class GameLogic {
  final GameState state;

  GameLogic(this.state);

  void handleTap(int index, Function(String) onWin, Function onDraw) {
    if (state.board[index] == '') {
      state.board[index] = state.oTurn ? 'O' : 'X';
      state.filledBoxes++;
      state.oTurn = !state.oTurn;
      _checkWinner(onWin, onDraw);
    }
  }

  void _checkWinner(Function(String) onWin, Function onDraw) {
    final winPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pos in winPositions) {
      if (state.board[pos[0]] != '' &&
          state.board[pos[0]] == state.board[pos[1]] &&
          state.board[pos[1]] == state.board[pos[2]]) {
        final winner = state.board[pos[0]];

        if (winner == 'O') {
          state.oScore++;
        } else {
          state.xScore++;
        }
        onWin(winner);
        return;
      }
    }

    if (state.filledBoxes == 9) {
      onDraw();
    }
  }
}
