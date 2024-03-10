import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';
import 'package:flutter_game/screens/game_over.dart';
import 'package:flutter_game/screens/main_menu.dart';


// Run the program.
void main() {
  final game = HoppyFrogGame();
  runApp(
    GameWidget(game: game,
      overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenu(game: game),
        'gameOver': (context, _) => GameOver(game: game),
      },
    ),
  );
}
