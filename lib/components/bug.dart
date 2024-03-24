import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/configuration.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';
import 'package:flutter_game/game/pipe_position.dart';

// The class for a bug, that will add additional points if gotten.
class Bug extends SpriteAnimationComponent
    with HasGameRef<HoppyFrogGame> {
  Bug({
    super.position,
  }) : super(
    size: Vector2(40, 50),
    anchor: Anchor.center,
  );

  Future<void> onLoad() async {
    await super.onLoad();

    // Sets up the animation to be added.
    animation = await game.loadSpriteAnimation(
      Assets.bug,
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: .2,
        textureSize: Vector2(32, 48),
      ),
    );
    // Flips the assets to make the bug face the desired direction.
    flipHorizontally();

    add(CircleHitbox(radius: 10, anchor: anchor, position: Vector2(anchor.x + 20, anchor.y + 22), collisionType: CollisionType.active));
  }

  @override
  void update(double dt) {
    super.update(dt);



    position.x -= dt * 150;

    // Removes the bug if it moves too far off screen.
    if (position.x < -15) {
      removeFromParent();
    }

    // Removes the first bug if the game is reset
    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

}