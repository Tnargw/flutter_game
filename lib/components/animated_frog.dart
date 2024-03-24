import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_game/components/bug.dart';
import 'package:flutter_game/components/ground.dart';
import 'package:flutter_game/game/configuration.dart';
import 'package:flutter_game/components/pipe.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';

class AnimatedFrog extends SpriteAnimationComponent
    with HasGameRef<HoppyFrogGame>, CollisionCallbacks {
  AnimatedFrog();

  int score = 0;
  int velocity = Config.frogVelocity;


  // Adds the frog and its hitbox.
  @override
  Future<void> onLoad() async {
    final frogHop = await gameRef.loadSprite(game.frogChoice, srcSize: Vector2.all(48));

    size = Vector2(75, 75);
    position = Vector2(45, 311);
    // current = frogMovement.normal;
    var runData = SpriteAnimationData.sequenced(amount: 7, stepTime: 0.15, textureSize: Vector2.all(48));
    var runImage = await Flame.images.load(game.frogChoice);

    animation = SpriteAnimation.fromFrameData(runImage, runData);
    // sprites = {
    //   frogMovement.normal: frogHop
    // };

    add(CircleHitbox(radius: 17, position: Vector2(position.x - 33, position.y - 290), collisionType: CollisionType.active));
  }

  // Makes the frog "hop" when called.
  void hop() {
    add(
        MoveByEffect(
          Vector2(0, Config.gravity),
          EffectController(duration: 0.2, curve: Curves.decelerate),
        )
    );
    velocity = Config.frogVelocity;
  }

  // Detects collision.
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Ground){
      velocity = 0;
    }
    else if (other is Bug){
      score += 5;
      other.removeFromParent();
    }
    else{
      other.parent?.removeFromParent();
      gameOver();

    }
  }

  // Restarts game.
  void reset() {
    position = Vector2(45, 321);
    score = 0;
  }


  // Calls the game over screen.
  void gameOver() {
    game.isHit = true;
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
  }


  // Makes the frog move.
  @override
  void update(double dt) {
    super.update(dt);
    position.y += velocity * dt;
  }
}
