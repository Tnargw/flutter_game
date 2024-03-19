import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';
import 'package:flame/widgets.dart';

class ChangeFrog extends StatelessWidget {
  final HoppyFrogGame game;

  const ChangeFrog({Key? key, required this.game}) : super(key: key);

  static const String id = 'changeFrog';

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

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
            image: AssetImage('assets/images/sky.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your Frog!',
              style: TextStyle(
                color: whiteTextColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 2 / 1,
                children: [
                  spriteAnimationButton(Assets.animatedFrog, () {
                    // onPressed for Button 1
                    game.frogChoice = Assets.animatedFrog;
                    game.changeFrog();
                    game.overlays.remove('changeFrog');
                    game.resumeEngine();
                  }),
                  spriteAnimationButton(Assets.animatedFrogGreenBlue, () {
                    // onPressed for Button 2
                    game.frogChoice = Assets.animatedFrogGreenBlue;
                    game.changeFrog();
                    game.overlays.remove('changeFrog');
                    game.resumeEngine();
                  }),
                  spriteAnimationButton(Assets.animatedFrogBlueBrown, () {
                    // onPressed for Button 3
                    game.frogChoice = Assets.animatedFrogBlueBrown;
                    game.changeFrog();
                    game.overlays.remove('changeFrog');
                    game.resumeEngine();
                  }),
                  spriteAnimationButton(Assets.animatedFrogBlueBlue, () {
                    // onPressed for Button 4
                    game.frogChoice = Assets.animatedFrogBlueBlue;
                    game.changeFrog();
                    game.overlays.remove('changeFrog');
                    game.resumeEngine();
                  }),
                  spriteAnimationButton(Assets.animatedFrogPurpleWhite, () {
                    // onPressed for Button 5
                    game.frogChoice = Assets.animatedFrogPurpleWhite;
                    game.changeFrog();
                    game.overlays.remove('changeFrog');
                    game.resumeEngine();
                  }),
                  spriteAnimationButton(Assets.animatedFrogPurpleBlue, () {
                    // onPressed for Button 6
                    game.frogChoice = Assets.animatedFrogPurpleBlue;
                    game.changeFrog();
                    game.overlays.remove('changeFrog');
                    game.resumeEngine();
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget spriteAnimationButton(String imagePath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 200,
        height: 75,
        child: SpriteAnimationWidget.asset(
          path: imagePath,
          data: SpriteAnimationData.sequenced(
            amount: 4, // Adjust amount according to your animation
            stepTime: 0.2, // Adjust stepTime according to your animation
            textureSize: Vector2(48, 32), // Adjust textureSize according to your animation
          ),
          playing: true, // Auto-play animation
          anchor: Anchor.center, // Adjust anchor position if needed
        ),
      ),
    );
  }
}
