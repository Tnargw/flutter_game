import 'package:flame/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';

class GameOver extends StatelessWidget {
  final HoppyFrogGame game;
  static const id = 'gameOver';

  const GameOver({super.key, required this.game});


  // Builds the "Game Over" screen.
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.black38,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRestart,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
            child: const Text(
              'Restart',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ),
  );

    void onRestart() {
      game.frog.score = 0;
      game.frog.reset();
      game.overlays.remove('gameOver');
      game.resumeEngine();
  }
}
