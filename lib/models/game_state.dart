class GameState {
  bool oTurn;
  List<String> board;
  int oScore;
  int xScore;
  int filledBoxes;

  GameState({
    this.oTurn = true,
    List<String>? board,
    this.oScore = 0,
    this.xScore = 0,
    this.filledBoxes = 0,
  }) : board = board ?? List.filled(9, '');

  void resetBoard() {
    board = List.filled(9, '');
    filledBoxes = 0;
  }

  void resetScores() {
    oScore = 0;
    xScore = 0;
    resetBoard();
  }
}
