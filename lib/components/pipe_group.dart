import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
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

    final heightMinusGround = gameRef.size.y - Config.groundHeight;

    final topHeight = _random.nextDouble() * 197 + 50;
    final bottomHeight = heightMinusGround - topHeight - 125;

    addAll([
      Pipe(pipePosition: PipePosition.top, height: topHeight),
      Pipe(pipePosition: PipePosition.bottom, height: bottomHeight)
    ]);

  }
  
  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -15) {
      removeFromParent();
      updateScore();
    }
  }

  void updateScore() {
    gameRef.animatedFrog.score += 1;
  }


}