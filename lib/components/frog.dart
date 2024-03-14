import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/configuration.dart';
import 'package:flutter_game/game/frog_movement.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';

class Frog extends SpriteGroupComponent<frogMovement>
    with HasGameRef<HoppyFrogGame>, CollisionCallbacks {
    Frog();

    int score = 0;

    // Adds the frog and its hitbox.
    @override
    Future<void> onLoad() async {
      final frogHop = await gameRef.loadSprite(Assets.basicFrog);

      size = Vector2(100, 100);
      position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
      current = frogMovement.normal;
      sprites = {
        frogMovement.normal: frogHop
      };

      add(CircleHitbox(radius: 15, position: Vector2(position.x - 15, position.y - 115), collisionType: CollisionType.active));
    }

    // Makes the frog "hop" when called.
    void hop() {
      add(
        MoveByEffect(
          Vector2(0, Config.gravity),
          EffectController(duration: 0.2, curve: Curves.decelerate),
          onComplete: () => current = frogMovement.normal,
        )
      );
    }

    // Detects collision.
    @override
    void onCollisionStart(
        Set<Vector2> intersectionPoints,
        PositionComponent other,
        ) {
      super.onCollisionStart(intersectionPoints, other);
      debugPrint("Collision");
      gameOver();
    }

    // Restarts game.
    void reset() {
      position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
      score = 0;
    }


    // Calls the game over screen.
    void gameOver() {
      gameRef.overlays.add('gameOver');
      gameRef.pauseEngine();
      game.isHit = true;
    }


    // Makes the frog move.
    @override
    void update(double dt) {
      super.update(dt);
      position.y += Config.frogVelocity * dt;
    }
}
