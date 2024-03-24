import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_game/components/bug.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';

class BugSpawner extends SpriteAnimationComponent
    with HasGameReference<HoppyFrogGame> {
  late final SpawnComponent _bugSpawner;

  final random = new Random();


  @override
  Future<void> onLoad() async {


    // Acts as a "SpawnComponent" which will continually spawn bugs while the game is going.
    _bugSpawner = SpawnComponent(
      period: 3.9,
      selfPositioning: true,
      factory: (index) {
        return Bug(
          position: position =
              Vector2(
                900,
                RandInt(),
              ),
        );
        },
      autoStart: true,
    );
    game.add(_bugSpawner);
  }

  RandInt(){
    double spawnPlace = random.nextInt(263) + 100;
    return spawnPlace;
  }



}
