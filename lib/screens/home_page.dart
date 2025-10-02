import 'package:flutter/material.dart';
import '../models/game_state.dart';
import '../logic/game_logic.dart';
import '../widgets/scoreboard.dart';
import '../widgets/game_board.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GameState _state = GameState();
  late final GameLogic _logic;

  @override
  void initState() {
    super.initState();
    _logic = GameLogic(_state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Column(
        children: [
          Expanded(
            child: ScoreBoard(xScore: _state.xScore, oScore: _state.oScore),
          ),
          Expanded(
            flex: 4,
            child: GameBoard(
              board: _state.board,
              onTap: (index) {
                setState(() {
                  _logic.handleTap(index, _showWinDialog, _showDrawDialog);
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    _state.resetScores();
                  });
                },
                child: const Text("Clear Score Board"),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("\" $winner \" is Winner!!!"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("Play Again"),
              onPressed: () {
                setState(() {
                  _state.resetBoard();
                });
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Draw"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("Play Again"),
              onPressed: () {
                setState(() {
                  _state.resetBoard();
                });
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
