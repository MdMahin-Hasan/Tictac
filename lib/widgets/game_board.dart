import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  final List<String> board;
  final Function(int) onTap;

  const GameBoard({required this.board, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: Center(
              child: Text(
                board[index],
                style: const TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
          ),
        );
      },
    );
  }
}
