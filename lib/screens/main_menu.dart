import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/animated_frog.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';

class MainMenu extends StatelessWidget {
  // Reference to parent game.
  final HoppyFrogGame game;

  const MainMenu({super.key, required this.game});
  static const String id = 'mainMenu';

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);


    // Builds the "Main Menu" screen.
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 750,
        width: 1000,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/sky.png'), // Image from assets
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hoppy Frog',
              style: TextStyle(
                color: whiteTextColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  game.overlays.remove('mainMenu');
                  game.resumeEngine();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteTextColor,
                ),
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '''Tap to jump!''',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: whiteTextColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 220,
              height: 40,
              child: ElevatedButton(
                onPressed: () {

                  game.overlays.remove('mainMenu');
                  game.overlays.add('changeFrog');

                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteTextColor,
                ),
                child: const Text(
                  'Change Frog',
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
