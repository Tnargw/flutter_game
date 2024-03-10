import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/configuration.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';

class Ground extends SpriteComponent with HasGameRef<HoppyFrogGame>{
  Ground() : super(priority: 1);

  // Adds the ground and its hit-box.
  @override
  Future<void> onLoad() async {
    final ground = await Flame.images.load(Assets.grass);
    size = gameRef.size;
    sprite = Sprite(ground);

    add(
      RectangleHitbox(
        position: Vector2(0, gameRef.size.y - Config.groundHeight),
        size: Vector2(gameRef.size.x, Config.groundHeight),
        collisionType: CollisionType.passive
      ),
    );

  }
}