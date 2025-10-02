import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  final int xScore;
  final int oScore;

  const ScoreBoard({required this.xScore, required this.oScore, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPlayer("Player X", xScore),
        _buildPlayer("Player O", oScore),
      ],
    );
  }

  Widget _buildPlayer(String name, int score) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          Text(score.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }
}
