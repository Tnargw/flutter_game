import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_game/components/pipe.dart';
import 'package:flutter_game/game/configuration.dart';
import 'package:flutter_game/game/hoppy_frog_game.dart';
import 'package:flutter_game/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<HoppyFrogGame> {
  PipeGroup();

  final _random = Random();

  // Dictates where the pipes spawn, and at what height they spawn.
  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    double randomInt = _random.nextDouble() * 150 + 50;

    add(Pipe(pipePosition: PipePosition.bottom, height: randomInt));
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -15) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.animatedFrog.score += 1;
  }


}