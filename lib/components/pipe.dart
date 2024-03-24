import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter_game/game/assets.dart';
import 'package:flutter_game/game/configuration.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';
import 'package:flutter_game/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<HoppyFrogGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  // Adds the pipes to the game.
  @override
  final double height;
  final PipePosition pipePosition;

  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeFlipped = await Flame.images.load(Assets.pipeFlipped);
    size = Vector2(50, height);

    // Handles the assets and placement of the top and bottom pipes.
    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeFlipped);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox(collisionType: CollisionType.passive));

    }
  }


